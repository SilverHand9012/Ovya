import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../auth/data/auth_providers.dart';

import '../report_generator.dart';
import '../../symptom_tracking/providers/symptom_notifier.dart';

class ReportScreen extends ConsumerStatefulWidget {
  const ReportScreen({super.key});

  @override
  ConsumerState<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<ReportScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool _isGenerating = false;
  Uint8List? _generatedPdf;

  @override
  void initState() {
    super.initState();
    _loadSavedName();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedName() async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return;
    
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString('patient_name_${user.uid}');
    if (savedName != null && savedName.isNotEmpty) {
      if (mounted) {
        _nameController.text = savedName;
      }
    }
  }

  Future<void> _saveName(String name) async {
    final user = ref.read(firebaseAuthProvider).currentUser;
    if (user == null) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('patient_name_${user.uid}', name);
  }

  Future<void> _handleGenerate() async {
    if (!_formKey.currentState!.validate()) return;
    
    final name = _nameController.text.trim();
    await _saveName(name);

    setState(() {
      _isGenerating = true;
      _generatedPdf = null;
    });

    try {
      final state = ref.read(symptomNotifierProvider);
      final logs = state.symptoms;
      
      // We need a risk result to build the report
      var riskResult = state.riskResult;
      
      // If we don't have one in state but we have logs, trigger an evaluation
      if (riskResult == null && logs.isNotEmpty) {
        ref.read(symptomNotifierProvider.notifier).evaluateLatest();
        riskResult = ref.read(symptomNotifierProvider).riskResult;
      }

      if (riskResult == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No risk data available. Please log symptoms first.')),
          );
        }
        return;
      }

      final generator = ReportGenerator();
      final pdfBytes = await generator.generateReport(
        patientName: name,
        riskResult: riskResult,
        recentLogs: logs.take(30).toList(), // Limit to ~30 recent logs contextually 
        language: Localizations.localeOf(context).languageCode,
      );

      if (mounted) {
        setState(() {
          _generatedPdf = pdfBytes;
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to generate report: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGenerating = false;
        });
      }
    }
  }

  void _handleShare() {
    if (_generatedPdf == null) return;
    Printing.sharePdf(
      bytes: _generatedPdf!,
      filename: 'ovya_pcos_report.pdf',
    );
  }

  void _handlePrint() {
    if (_generatedPdf == null) return;
    Printing.layoutPdf(
      onLayout: (format) async => _generatedPdf!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: Text(loc.btn_generate_report, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Info Banner
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.shield_outlined, color: colors.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          loc.report_offline_note,
                          style: TextStyle(color: colors.onPrimaryContainer),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Patient Name Input
                Text(
                  loc.report_patient_name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colors.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: colors.surfaceContainerHighest.withValues(alpha: 0.3),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return loc.report_enter_name;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Preview Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: colors.outlineVariant),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.picture_as_pdf, color: colors.error),
                          const SizedBox(width: 8),
                          Text(
                            loc.report_preview_title,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      _PreviewRow(icon: Icons.personal_injury, text: loc.report_preview_demographics),
                      const SizedBox(height: 12),
                      _PreviewRow(icon: Icons.analytics_outlined, text: loc.report_preview_risk),
                      const SizedBox(height: 12),
                      _PreviewRow(icon: Icons.list_alt, text: loc.report_preview_logs),
                      const SizedBox(height: 12),
                      _PreviewRow(icon: Icons.health_and_safety, text: loc.report_preview_recs),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Generate Button
                if (_generatedPdf == null)
                  ElevatedButton(
                    onPressed: _isGenerating ? null : _handleGenerate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: _isGenerating
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(color: colors.onPrimary, strokeWidth: 2),
                          )
                        : Text(
                            loc.btn_generate_report,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                  ),

                // Result Buttons
                if (_generatedPdf != null) ...[
                  ElevatedButton.icon(
                    onPressed: _handleShare,
                    icon: const Icon(Icons.share),
                    label: Text(
                      loc.report_share_btn,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _handlePrint,
                    icon: const Icon(Icons.print),
                    label: Text(
                      loc.report_print_btn,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colors.primary,
                      side: BorderSide(color: colors.primary, width: 2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PreviewRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
