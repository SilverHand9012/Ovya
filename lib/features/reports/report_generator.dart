import 'dart:typed_data';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../core/intelligence/detection_engine.dart';
import '../symptom_tracking/domain/symptom_entity.dart';

class ReportGenerator {
  static const primaryColor = PdfColor.fromInt(0xFFE91E63); // pink
  static const lowColor = PdfColor.fromInt(0xFF2E7D32);
  static const mediumColor = PdfColor.fromInt(0xFFF9A825);
  static const highColor = PdfColor.fromInt(0xFFC62828);

  Future<Uint8List> generateReport({
    required String patientName,
    required RiskResult riskResult,
    required List<SymptomEntity> recentLogs,
    required AppLocalizations loc,
    required String language,
  }) async {
    // Load Universal Font Base for Latin characters
    final fontData = await rootBundle.load("assets/fonts/NotoSans-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);

    // Load Kannada font
    final kannadaData = await rootBundle.load("assets/fonts/NotoSansKannada-Regular.ttf");
    final kannadaFont = pw.Font.ttf(kannadaData);

    // Load Telugu font
    final teluguData = await rootBundle.load("assets/fonts/NotoSansTelugu-Regular.ttf");
    final teluguFont = pw.Font.ttf(teluguData);

    // Load Devanagari extensions for Hindi & Marathi
    final devData = await rootBundle.load("assets/fonts/NotoSansDevanagari-Regular.ttf");
    final devanagariFont = pw.Font.ttf(devData);

    pw.Font getFont(String langCode) {
      switch (langCode) {
        case 'kn':
          return kannadaFont;
        case 'te':
          return teluguFont;
        case 'hi':
        case 'mr':
          return devanagariFont;
        default:
          return ttf;
      }
    }

    final selectedFont = getFont(language);

    // 3. Enforce Unicode Standard across Engine Document
    // Use ttf (NotoSans) as base for Latin/Numbers and selectedFont as fallback for regional scripts
    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: ttf,
        fontFallback: [selectedFont],
      ),
    );

    final nowStr = DateFormat.yMMMMd(language).format(DateTime.now());

    // Resolve recommendations keys to strings using our mapping helper
    final parsedRecs = riskResult.recommendations.map((key) => _getRecommendation(loc, key)).toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(loc.report_title, 
                        style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold, color: primaryColor)),
                      pw.Text(loc.pdfDateGenerated(nowStr), style: const pw.TextStyle(fontSize: 14)),
                    ],
                  ),
                  pw.Text(nowStr, style: const pw.TextStyle(fontSize: 10)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(color: primaryColor),
              pw.SizedBox(height: 20),
            ],
          );
        },
        footer: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Divider(),
              pw.SizedBox(height: 8),
              pw.Center(
                child: pw.Text(
                  loc.pdfDisclaimer, 
                  style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey), 
                  textAlign: pw.TextAlign.center
                ),
              ),
              pw.SizedBox(height: 4),
              pw.Center(
                child: pw.Text(
                  loc.pdfGeneratedBy, 
                  style: const pw.TextStyle(fontSize: 9), 
                  textAlign: pw.TextAlign.center
                ),
              ),
            ],
          );
        },
        build: (context) {
          return [
            // Patient Info
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey300),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(loc.patientDetails, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 6),
                  pw.Text(loc.patientNameLabel(patientName)),
                  pw.Text(loc.reportDateLabel(nowStr)),
                ],
              ),
            ),
            pw.SizedBox(height: 24),

            // Risk Assessment Box
            pw.Container(
              padding: const pw.EdgeInsets.all(16),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.grey300),
                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(8)),
                color: PdfColors.grey50,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(loc.insights, style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: primaryColor)),
                  pw.Divider(color: primaryColor),
                  pw.SizedBox(height: 8),
                  
                  pw.Row(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(loc.riskLevelLabel, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 4),
                            pw.Container(
                              padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: pw.BoxDecoration(
                                color: _getRiskColor(riskResult.level),
                                borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
                              ),
                              child: pw.Text(
                                _getRiskLevel(loc, riskResult.level),
                                style: const pw.TextStyle(color: PdfColors.white),
                              ),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text('${loc.scoreLabel} ${riskResult.score} / 23'),
                          ],
                        ),
                      ),
                      pw.SizedBox(width: 20),
                      pw.Expanded(
                        flex: 2,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            if (riskResult.pcosTypeHint != null) ...[
                              pw.Text(loc.pcosTypeHintLabel, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                              pw.Text(loc.pcos_type_hint(_getPcosTypeName(loc, riskResult.pcosTypeHint!))),
                              pw.SizedBox(height: 8),
                            ],
                            pw.Text(loc.explanationLabel, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 4),
                            pw.Text(
                              riskResult.activeSymptoms.isEmpty 
                                ? riskResult.explanation 
                                : loc.report_summary(_localizeSymptoms(loc, riskResult.activeSymptoms), _getRiskLevel(loc, riskResult.level))
                            ),
                          ],
                        )
                      )
                    ]
                  ),
                ],
              ),
            ),
            pw.SizedBox(height: 24),

            // Recommendations
            pw.Text(loc.recommendations, style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            ...parsedRecs.asMap().entries.map((entry) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 6),
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('• ', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Expanded(child: pw.Text(entry.value)),
                ],
              )
            )),
            pw.SizedBox(height: 24),

            // Logs Table
            pw.Text(loc.cycle_history, style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 8),
            _buildLogsTable(recentLogs.take(10).toList(), language, loc),
          ];
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildLogsTable(List<SymptomEntity> logs, String language, AppLocalizations loc) {
    if (logs.isEmpty) {
      return pw.Container(
        padding: const pw.EdgeInsets.all(12),
        decoration: const pw.BoxDecoration(
          color: PdfColors.grey100,
          borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
        ),
        child: pw.Text(loc.noSymptoms30Days, style: const pw.TextStyle(color: PdfColors.grey700)),
      );
    }

    final headers = [loc.tableHeaderDate, loc.tableHeaderSymptoms, loc.tableHeaderMood];
    
    final data = logs.map((log) {
      final dateStr = DateFormat.yMd(language).format(log.timestamp);
      
      final active = <String>[];
      if (log.irregularCycle) active.add(loc.irregularCycle);
      if (log.acne) active.add(loc.acne);
      if (log.weightGain) active.add(loc.weightGain);
      if (log.hairGrowth) active.add(loc.excessHairGrowth);
      if (log.moodIssues) active.add(loc.moodIssues);
      if (log.hairThinning) active.add(loc.hairThinning);
      if (log.skinDarkening) active.add(loc.skinDarkening);
      if (log.fatigue) active.add(loc.fatigue);
      if (log.sleepProblems) active.add(loc.sleepProblems);
      if (log.bloating) active.add(loc.bloating);
      final sympStr = active.join(', ');
      
      final notes = log.notes ?? '-';

      return [dateStr, sympStr.isEmpty ? loc.tableNone : sympStr, notes];
    }).toList();

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: data,
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.white),
      headerDecoration: const pw.BoxDecoration(color: primaryColor),
      rowDecoration: const pw.BoxDecoration(border: pw.Border(bottom: pw.BorderSide(color: PdfColors.grey200, width: 0.5))),
      cellStyle: const pw.TextStyle(fontSize: 10),
      cellAlignment: pw.Alignment.centerLeft,
      cellHeight: 30,
      cellPadding: const pw.EdgeInsets.all(6),
    );
  }

  String _getRecommendation(AppLocalizations loc, String key) {
    switch (key) {
      case 'rec_track_regularly': return loc.rec_track_regularly;
      case 'rec_balanced_diet': return loc.rec_balanced_diet;
      case 'rec_schedule_checkup': return loc.rec_schedule_checkup;
      case 'rec_monitor_cycle': return loc.rec_monitor_cycle;
      case 'rec_stress_management': return loc.rec_stress_management;
      case 'rec_consult_gynecologist': return loc.rec_consult_gynecologist;
      case 'rec_request_bloodwork': return loc.rec_request_bloodwork;
      case 'rec_symptom_diary': return loc.rec_symptom_diary;
      default: return key;
    }
  }

  String _localizeSymptoms(AppLocalizations loc, List<String> activeSymptoms) {
    if (activeSymptoms.isEmpty) return '';
    final localized = activeSymptoms.map((s) {
      switch(s) {
        case 'Irregular cycle': return loc.irregularCycle;
        case 'Excess hair growth': return loc.excessHairGrowth;
        case 'Family history of PCOS': return loc.q_family_history;
        case 'Hair thinning/loss': return loc.hairThinning;
        case 'Weight gain': return loc.weightGain;
        case 'Acne': return loc.acne;
        case 'Skin darkening': return loc.skinDarkening;
        case 'Difficulty conceiving': return loc.q_difficulty_conceiving;
        case 'Fatigue': return loc.fatigue;
        case 'Mood issues': return loc.moodIssues;
        case 'Sleep problems': return loc.sleepProblems;
        case 'Bloating': return loc.bloating;
        default: return s;
      }
    }).toList();
    if (localized.length == 1) return localized.first;
    if (localized.length == 2) return '${localized[0]}, ${localized[1]}';
    final allButLast = localized.sublist(0, localized.length - 1).join(', ');
    return '$allButLast, ${localized.last}';
  }

  String _getPcosTypeName(AppLocalizations loc, String type) {
    switch (type) {
      case 'Insulin-resistant': return loc.type_insulin_resistant;
      case 'Androgenic': return loc.type_androgenic;
      case 'Adrenal': return loc.type_adrenal;
      default: return type;
    }
  }

  String _getRiskLevel(AppLocalizations loc, String level) {
    if (level.toLowerCase() == 'low') return loc.low;
    if (level.toLowerCase() == 'medium') return loc.medium;
    if (level.toLowerCase() == 'high') return loc.high;
    return level;
  }

  PdfColor _getRiskColor(String risk) {
    final lowerRisk = risk.toLowerCase();
    if (lowerRisk == 'low') return lowColor;
    if (lowerRisk == 'medium') return mediumColor;
    if (lowerRisk == 'high') return highColor;
    return PdfColors.grey;
  }
}
