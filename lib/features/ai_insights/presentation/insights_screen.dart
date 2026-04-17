import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/insights_notifier.dart';
import '../../../shared/widgets/status_banner.dart';

/// Screen for displaying AI-generated PCOS insights.
///
/// - Shows the latest insight with an "AI" or "Cached" badge.
/// - Pull-to-refresh triggers a new Gemini API call (if online).
/// - History section shows previously cached insights.
class InsightsScreen extends ConsumerStatefulWidget {
  const InsightsScreen({super.key});

  @override
  ConsumerState<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends ConsumerState<InsightsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(insightsNotifierProvider.notifier).loadInsights();
    });
  }

  Future<void> _refresh() async {
    await ref.read(insightsNotifierProvider.notifier).generateNewInsight();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(insightsNotifierProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Insights'),
        actions: [
          if (state.insights.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Clear cache',
              onPressed: () {
                ref.read(insightsNotifierProvider.notifier).clearCache();
              },
            ),
        ],
      ),
      body: Column(
        children: [
          const SyncStatusBanner(),
          AiStatusBanner(
            isLoading: state.isLoading,
            isFromCache: state.isFromCache,
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.latestInsight == null && state.insights.isEmpty
                      ? _buildEmptyState(theme)
                      : _buildContent(theme, state),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: state.isLoading ? null : _refresh,
        icon: const Icon(Icons.auto_awesome),
        label: const Text('Generate Insight'),
      ),
    );
  }

  // ── Empty state ──────────────────────────────────────────────

  Widget _buildEmptyState(ThemeData theme) {
    return ListView(
      children: [
        const SizedBox(height: 120),
        Icon(
          Icons.psychology_outlined,
          size: 80,
          color: theme.colorScheme.primary.withValues(alpha: 0.4),
        ),
        const SizedBox(height: 16),
        Text(
          'No insights yet',
          textAlign: TextAlign.center,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Log your symptoms first, then tap\n"Generate Insight" for personalised advice.',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }

  // ── Main content ─────────────────────────────────────────────

  Widget _buildContent(ThemeData theme, dynamic state) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── Latest insight card ────────────────────────────────
        if (state.latestInsight != null)
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Latest Insight',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Chip(
                        label: Text(
                          state.isFromCache ? 'Cached' : 'AI Generated',
                          style: const TextStyle(fontSize: 11),
                        ),
                        backgroundColor: state.isFromCache
                            ? Colors.orange.withValues(alpha: 0.2)
                            : Colors.green.withValues(alpha: 0.2),
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.latestInsight!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // ── Disclaimer ────────────────────────────────────────
        const SizedBox(height: 12),
        Card(
          color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'This is informational only and not a medical diagnosis. '
                    'Please consult a healthcare professional.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ── Error message ─────────────────────────────────────
        if (state.errorMessage != null) ...[
          const SizedBox(height: 12),
          Text(
            state.errorMessage!,
            style: TextStyle(color: theme.colorScheme.error),
          ),
        ],

        // ── History ───────────────────────────────────────────
        if (state.insights.length > 1) ...[
          const SizedBox(height: 24),
          Text(
            'Previous Insights',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ...state.insights.skip(1).map(
                (cache) => Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    leading: Icon(
                      cache.isFromAi
                          ? Icons.auto_awesome
                          : Icons.cached,
                      color: cache.isFromAi
                          ? theme.colorScheme.primary
                          : Colors.orange,
                    ),
                    title: Text(
                      cache.insightText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '${cache.generatedAt.day}/${cache.generatedAt.month}/${cache.generatedAt.year}',
                    ),
                  ),
                ),
              ),
        ],

        // Extra padding for FAB.
        const SizedBox(height: 80),
      ],
    );
  }
}
