import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ovya/l10n/gen/app_localizations.dart';

import '../../app/theme.dart';
import '../symptom_tracking/providers/symptom_notifier.dart';
import '../symptom_tracking/domain/symptom_entity.dart';
import '../../core/intelligence/detection_engine.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  late DateTime _focusedMonth;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month);
    _selectedDay = DateTime.now();
  }

  void _prevMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
  }

  /// Get active symptom labels for a SymptomEntity.
  List<String> _getActiveSymptoms(SymptomEntity s, AppLocalizations loc) {
    final list = <String>[];
    if (s.irregularCycle) list.add(loc.irregularCycle);
    if (s.acne) list.add(loc.acne);
    if (s.weightGain) list.add(loc.weightGain);
    if (s.hairGrowth) list.add(loc.excessHairGrowth);
    if (s.moodIssues) list.add(loc.moodIssues);
    if (s.hairThinning) list.add(loc.hairThinning);
    if (s.skinDarkening) list.add(loc.skinDarkening);
    if (s.fatigue) list.add(loc.fatigue);
    if (s.sleepProblems) list.add(loc.sleepProblems);
    if (s.bloating) list.add(loc.bloating);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final symptomState = ref.watch(symptomNotifierProvider);
    final symptoms = symptomState.symptoms;
    final locale = Localizations.localeOf(context).toString();

    // Dates that have logs (for dot indicators)
    final loggedDates = <DateTime>{};
    for (final s in symptoms) {
      loggedDates.add(DateTime(s.timestamp.year, s.timestamp.month, s.timestamp.day));
    }

    // Recent assessments — group by unique risk evaluations
    final engine = DetectionEngine();
    final assessments = <_AssessmentData>[];
    for (final s in symptoms.take(5)) {
      final result = engine.evaluate(s);
      assessments.add(_AssessmentData(
        symptom: s,
        risk: result,
      ));
    }

    // Daily logs sorted by date descending
    final sortedLogs = List<SymptomEntity>.from(symptoms)
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: kTextPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          loc.my_history,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // ── 1. Calendar Section ──────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: _CalendarCard(
                focusedMonth: _focusedMonth,
                selectedDay: _selectedDay,
                loggedDates: loggedDates,
                locale: locale,
                onPrevMonth: _prevMonth,
                onNextMonth: _nextMonth,
                onDaySelected: (day) {
                  setState(() => _selectedDay = day);
                },
              ),
            ),
          ),

          // ── 2. Recent Assessments Header ─────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
              child: Text(
                loc.history_recent_assessments,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),

          // ── 3. Assessment Cards (horizontal scroll) ──────────────
          SliverToBoxAdapter(
            child: SizedBox(
              height: 130,
              child: assessments.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          loc.history_no_assessments,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: kTextSecondary,
                              ),
                        ),
                      ),
                    )
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: assessments.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final a = assessments[index];
                        return _AssessmentCard(
                          riskLevel: a.risk.level,
                          typeHint: a.risk.pcosTypeHint,
                          date: a.symptom.timestamp,
                          locale: locale,
                          loc: loc,
                        );
                      },
                    ),
            ),
          ),

          // ── 4. Daily Logs Header ─────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
              child: Text(
                loc.history_daily_logs,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),

          // ── 5. Daily Log Cards ───────────────────────────────────
          sortedLogs.isEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    child: Center(
                      child: Text(
                        loc.history_no_logs,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: kTextSecondary,
                            ),
                      ),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final log = sortedLogs[index];
                        final activeSymptoms = _getActiveSymptoms(log, loc);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _DailyLogCard(
                            symptom: log,
                            activeSymptoms: activeSymptoms,
                            locale: locale,
                            loc: loc,
                          ),
                        );
                      },
                      childCount: sortedLogs.length,
                    ),
                  ),
                ),

          // Bottom padding
          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ],
      ),
    );
  }
}

// ─── Pastel color palette for calendar rows ─────────────────────────
const _calendarPastels = [
  Color(0xFFF3E8FF), // soft lavender
  Color(0xFFE8F5E9), // mint green
  Color(0xFFFFF8E1), // warm cream
  Color(0xFFE3F2FD), // sky blue
  Color(0xFFFCE4EC), // rose blush
  Color(0xFFF3E5F5), // orchid
];

// ─── Calendar Card ──────────────────────────────────────────────────
class _CalendarCard extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime? selectedDay;
  final Set<DateTime> loggedDates;
  final String locale;
  final VoidCallback onPrevMonth;
  final VoidCallback onNextMonth;
  final ValueChanged<DateTime> onDaySelected;

  const _CalendarCard({
    required this.focusedMonth,
    required this.selectedDay,
    required this.loggedDates,
    required this.locale,
    required this.onPrevMonth,
    required this.onNextMonth,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    final monthLabel = DateFormat.yMMMM(locale).format(focusedMonth);
    final daysInMonth = DateTime(focusedMonth.year, focusedMonth.month + 1, 0).day;
    final firstWeekday = DateTime(focusedMonth.year, focusedMonth.month, 1).weekday % 7; // 0=Sun
    final today = DateTime.now();

    // Day-of-week headers
    final dayHeaders = DateFormat.E(locale);
    final weekStart = DateTime(2023, 1, 1); // A Sunday
    final headerLabels = List.generate(7, (i) {
      return dayHeaders.format(weekStart.add(Duration(days: i)))[0].toUpperCase();
    });

    // Calculate total rows for alternating pastel backgrounds
    final totalCells = firstWeekday + daysInMonth;
    final totalRows = (totalCells / 7).ceil();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            const Color(0xFFF8F0FF), // very subtle lavender
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kAccent.withValues(alpha: 0.15), width: 1),
      ),
      child: Column(
        children: [
          // Month header with navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                monthLabel,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onPrevMonth,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: kPurpleCard.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.chevron_left, size: 20, color: kAccent),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onNextMonth,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: kPurpleCard.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.chevron_right, size: 20, color: kAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Day-of-week headers with pastel background
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: kPurpleCard.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: headerLabels.map((label) {
                return SizedBox(
                  width: 36,
                  child: Center(
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: kAccent,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 4),

          // Date grid with pastel row backgrounds
          ...List.generate(totalRows, (rowIndex) {
            final pastelBg = _calendarPastels[rowIndex % _calendarPastels.length];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                color: pastelBg.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (colIndex) {
                  final cellIndex = rowIndex * 7 + colIndex;
                  if (cellIndex < firstWeekday || cellIndex >= firstWeekday + daysInMonth) {
                    return const SizedBox(width: 36, height: 44);
                  }

                  final day = cellIndex - firstWeekday + 1;
                  final date = DateTime(focusedMonth.year, focusedMonth.month, day);
                  final isToday = date.year == today.year &&
                      date.month == today.month &&
                      date.day == today.day;
                  final isSelected = selectedDay != null &&
                      date.year == selectedDay!.year &&
                      date.month == selectedDay!.month &&
                      date.day == selectedDay!.day;
                  final hasLog = loggedDates.contains(date);

                  return GestureDetector(
                    onTap: () => onDaySelected(date),
                    child: SizedBox(
                      width: 36,
                      height: 44,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? kAccent
                                  : isToday
                                      ? kAccent.withValues(alpha: 0.15)
                                      : Colors.transparent,
                              shape: BoxShape.circle,
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: kAccent.withValues(alpha: 0.3),
                                        blurRadius: 6,
                                        offset: const Offset(0, 2),
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                '$day',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: isSelected || isToday
                                      ? FontWeight.bold
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? Colors.white
                                      : isToday
                                          ? kAccent
                                          : kTextPrimary,
                                ),
                              ),
                            ),
                          ),
                          if (hasLog)
                            Container(
                              width: 5,
                              height: 5,
                              margin: const EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                color: kAccent,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: kAccent.withValues(alpha: 0.3),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            )
                          else
                            const SizedBox(height: 7),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ─── Assessment Card ────────────────────────────────────────────────
class _AssessmentCard extends StatelessWidget {
  final String riskLevel;
  final String? typeHint;
  final DateTime date;
  final String locale;
  final AppLocalizations loc;

  const _AssessmentCard({
    required this.riskLevel,
    required this.typeHint,
    required this.date,
    required this.locale,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    // Risk badge color
    Color badgeColor;
    Color badgeTextColor;
    String badgeText;

    switch (riskLevel) {
      case 'High':
        badgeColor = const Color(0xFFFFE0E0);
        badgeTextColor = kHighRisk;
        badgeText = loc.high_risk;
        break;
      case 'Medium':
        badgeColor = const Color(0xFFFFF4B0);
        badgeTextColor = const Color(0xFFB58B00);
        badgeText = loc.moderate_risk;
        break;
      default:
        badgeColor = kSyncGreen;
        badgeTextColor = const Color(0xFF2D7A4F);
        badgeText = loc.low_risk;
    }

    // Title from type hint
    final title = typeHint ?? loc.history_general_profile;
    final dateStr = DateFormat.yMMMd(locale).format(date);

    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned(
              right: -8,
              bottom: -8,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: kPurpleCard.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.psychology_outlined, size: 20, color: kAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Risk badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      badgeText,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: badgeTextColor,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dateStr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: kTextSecondary,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Daily Log Card ─────────────────────────────────────────────────
class _DailyLogCard extends StatelessWidget {
  final SymptomEntity symptom;
  final List<String> activeSymptoms;
  final String locale;
  final AppLocalizations loc;

  const _DailyLogCard({
    required this.symptom,
    required this.activeSymptoms,
    required this.locale,
    required this.loc,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat.MMMd(locale).format(symptom.timestamp);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.6), width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
              right: -10,
              bottom: -10,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: kPurpleCard.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.spa_outlined, size: 24, color: kAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header row
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          dateStr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),

          // Symptom tags as chips (always show)
          if (activeSymptoms.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: activeSymptoms.take(4).map((s) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: kPurpleCard.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    s,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: kAccentDeep,
                    ),
                  ),
                );
              }).toList(),
            ),
          ] else ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: kBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                loc.history_no_symptoms_tag,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: kTextSecondary,
                ),
              ),
            ),
          ],

          // Notes
          if (symptom.notes != null && symptom.notes!.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              symptom.notes!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: kTextPrimary,
                    height: 1.5,
                  ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],

          // Hashtag chips from notes
          if (symptom.notes != null && symptom.notes!.isNotEmpty) ...[
            Builder(builder: (context) {
              final hashtags = RegExp(r'#\w+')
                  .allMatches(symptom.notes!)
                  .map((m) => m.group(0)!)
                  .toList();
              if (hashtags.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: hashtags.map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: kGreenCard.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D7A4F),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ],
        ],
      ),
    ),
  ],
),
      ),
    );
  }
}

// ─── Helper data class ──────────────────────────────────────────────
class _AssessmentData {
  final SymptomEntity symptom;
  final RiskResult risk;
  const _AssessmentData({required this.symptom, required this.risk});
}
