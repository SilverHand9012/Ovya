import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../app/theme.dart';
import '../providers/cycle_provider.dart';

class CycleScreen extends ConsumerStatefulWidget {
  const CycleScreen({super.key});

  @override
  ConsumerState<CycleScreen> createState() => _CycleScreenState();
}

class _CycleScreenState extends ConsumerState<CycleScreen> {
  DateTime? _selectedDate;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kAccent,
              onPrimary: Colors.white,
              onSurface: kTextPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveEntry() {
    if (_selectedDate != null) {
      ref.read(cycleProvider.notifier).addCycleDate(_selectedDate!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cycle date saved successfully!')),
      );
      setState(() {
        _selectedDate = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cycles = ref.watch(cycleProvider);
    final locale = Localizations.localeOf(context).toString();

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text('Cycle Tracking'),
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Log a New Cycle',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: _pickDate,
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: kAccent.withValues(alpha: 0.1)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_month, color: kAccent),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              _selectedDate == null
                                  ? 'Select start date'
                                  : DateFormat.yMMMMd(locale).format(_selectedDate!),
                              style: TextStyle(
                                fontSize: 16,
                                color: _selectedDate == null ? kTextSecondary : kTextPrimary,
                                fontWeight: _selectedDate != null ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _selectedDate == null ? null : _saveEntry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Save Entry',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 12),
              child: Text(
                'Recent Cycles',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          
          cycles.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Center(
                      child: Text(
                        'No cycle entries yet.',
                        style: TextStyle(color: kTextSecondary),
                      ),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final entry = cycles[index];
                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: kAccent.withValues(alpha: 0.1)),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            leading: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kPurpleCard.withValues(alpha: 0.3),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.water_drop, color: kAccent, size: 20),
                            ),
                            title: Text(
                              DateFormat.yMMMMd(locale).format(entry.startDate),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text('Period started'),
                          ),
                        );
                      },
                      childCount: cycles.length,
                    ),
                  ),
                ),
                
          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ],
      ),
    );
  }
}
