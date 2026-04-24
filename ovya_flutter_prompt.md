# Ovya — Flutter Frontend Production Prompt

---

You are a senior Flutter engineer and UI/UX specialist building **Ovya**, a production-grade offline-first PCOS health app targeting women in India (SDG 3 & SDG 5). The app must run at **60fps on mid-range Android devices** with a soft, neumorphic-pastel wellness aesthetic.

---

## Design System

### Color Palette
```dart
// lib/app/theme.dart
const Color kBackground    = Color(0xFFFFF0F3); // warm blush — page bg
const Color kSurface       = Color(0xFFFFFFFF); // card surface
const Color kPurpleCard    = Color(0xFFD6D0FF); // "Log today" card
const Color kYellowCard    = Color(0xFFFFF4B0); // "Doctor report" card
const Color kGreenCard     = Color(0xFFD4F0DC); // action card accent
const Color kAlertCard     = Color(0xFFFFF0F0); // elevated risk banner
const Color kAccent        = Color(0xFF6B4EFF); // primary purple CTA
const Color kAccentDeep    = Color(0xFF3D1F8F); // deep purple text
const Color kTextPrimary   = Color(0xFF1A1A2E);
const Color kTextSecondary = Color(0xFF6B6B80);
const Color kSyncGreen     = Color(0xFFB8F5D0); // synced badge bg
const Color kHighRisk      = Color(0xFFFF4D4D); // HIGH RISK headline
```

### Typography (Baloo 2 family for all 5 languages)
```dart
// pubspec.yaml — add google_fonts: ^6.2.1
// Use these font families per locale:
// en, hi, mr  → 'Baloo 2'
// kn          → 'Baloo Tamma 2'
// te          → 'Baloo Tammudu 2'

TextTheme buildTextTheme(Locale locale) {
  final family = switch (locale.languageCode) {
    'kn' => 'Baloo Tamma 2',
    'te' => 'Baloo Tammudu 2',
    _    => 'Baloo 2',
  };
  return GoogleFonts.getTextTheme(family).copyWith(
    displayLarge : GoogleFonts.getFont(family, fontSize: 34, fontWeight: FontWeight.w700),
    titleLarge   : GoogleFonts.getFont(family, fontSize: 22, fontWeight: FontWeight.w700),
    titleMedium  : GoogleFonts.getFont(family, fontSize: 17, fontWeight: FontWeight.w600),
    bodyLarge    : GoogleFonts.getFont(family, fontSize: 15, fontWeight: FontWeight.w400),
    bodyMedium   : GoogleFonts.getFont(family, fontSize: 13, fontWeight: FontWeight.w400),
    labelSmall   : GoogleFonts.getFont(family, fontSize: 11, fontWeight: FontWeight.w500),
  );
}
```

### Key Design Rules
- All cards use `borderRadius: BorderRadius.circular(20)` and NO `BoxShadow` — use subtle border `Border.all(color: Colors.white.withOpacity(0.6), width: 1)` for neumorphic effect
- Page background is always `kBackground`
- CTA buttons: `BorderRadius.circular(30)`, full width, `kAccent` fill, white text, `Baloo 2 SemiBold`
- All cards are tappable with `InkWell` wrapped in `Material(color: Colors.transparent)`
- `GoogleFonts.config.allowRuntimeFetching = false;` in `main()` — bundle fonts

---

## Screen 1 — Home / Sanctuary Screen

**Route:** `/` (default)
**Widget:** `SanctuaryScreen` — `StatefulWidget`
**Scroll:** `CustomScrollView` with `SliverList` — never `SingleChildScrollView` + `Column`

### Layout (top to bottom, all inside CustomScrollView)

#### 1. AppBar (SliverAppBar, pinned: false, floating: true)
- Left: `IconButton` hamburger (opens drawer)
- Center: Text `"Ovya"` — Baloo 2 Bold 20px kTextPrimary
- Right: `CircleAvatar` with user initials, `kAccent` bg, white text

#### 2. Greeting Section (SliverToBoxAdapter)
```
"Good morning,"       → bodyLarge, kTextSecondary
"Priya 🌸"            → displayLarge, kTextPrimary (emoji via Unicode \u{1F338})
```
- Right-aligned: `SyncBadge` widget (see below)
- Padding: `EdgeInsets.fromLTRB(20, 24, 20, 0)`

#### 3. SyncBadge Widget (standalone StatefulWidget)
```dart
class SyncBadge extends StatefulWidget — show syncing vs synced state

// States:
// syncing: animated rotating icon (RotationTransition, duration 1.2s, repeat)
// synced:  static checkmark, "SYNCED JUST NOW" text

// Visual: rounded pill, kSyncGreen bg, 11px Baloo 2 Medium kAccentDeep text
// Icon: Icons.sync (syncing, rotating) / Icons.check_circle_outline (synced)
// On init: show syncing for 2.5s, then flip to synced with FadeTransition
// Trigger re-sync: expose syncNow() method, called by ConnectivityOrchestrator
```

#### 4. Risk Alert Card (SliverToBoxAdapter) — show conditionally
```dart
// Only shown when DetectionEngine returns RiskLevel.moderate or high
// Container, kAlertCard bg, Border.all(color: Color(0xFFFFCDD2)), radius 20

// Layout:
// Row: [warning icon (amber)] [Text "ELEVATED RISK" — 11px uppercase label] [... more button]
// Below: Text "PCOS Flare-up Detected" — titleMedium, kAccentDeep, bold
// Below: body text description — bodyMedium, kTextSecondary
// Below: full-width CTA "Review Assessment →" — kAccent fill, white text, radius 30

// Tap on CTA → Navigator.pushNamed(context, '/results') with hero tag 'risk-card'
// Wrap card in Hero(tag: 'risk-card', ...)
```

#### 5. "Today's Focus" Section Header (SliverToBoxAdapter)
```
Text "Today's Focus" — titleLarge, kTextPrimary, padding 20px sides, 24px top
```

#### 6. Focus Grid (SliverPadding > SliverGrid)
```dart
SliverGrid(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 1.0,
  ),
)
// Items: Log Today (kPurpleCard), Doctor Report (kYellowCard),
//        Ask Ovya (white), My History (white)
```

**FocusCard Widget:**
```dart
class FocusCard extends StatefulWidget {
  final String title;      // localized
  final Color bgColor;
  final String route;
  final Widget? illustration; // custom painter or Image.asset
  
  // Tap animation: scale down to 0.95 on press, back to 1.0 on release
  // Use GestureDetector + AnimatedScale (duration 120ms, curve Curves.easeOut)
  // On tap: await Future.delayed(120ms) then Navigator.pushNamed(context, route)
  // with custom page route (see Transitions section)

  // Arrow icon: bottom-right, Icons.north_east, 18px, kTextSecondary
  // Title: titleMedium, kTextPrimary, top-left
}
```

#### 7. "Mindful Moment" Section (SliverToBoxAdapter)
```dart
// Section header: "Mindful Moment" — titleLarge
// Card: white bg, radius 20, Row layout:
//   Left: circular icon container (kYellowCard bg, herb icon or Image.asset)
//   Right: Column[ title "Ashwagandha Tea" — titleMedium, description — bodyMedium kTextSecondary ]
// Tap → show BottomSheet with full tip details
```

#### 8. Bottom Nav (persistent, outside scroll view)
```dart
// Custom BottomNavigationBar — DO NOT use Flutter's default which causes full rebuild
// Use IndexedStack to preserve scroll state across tabs — CRITICAL for performance
// 4 tabs: Sanctuary (lotus icon), Insights (chart icon), Journal (book icon), Profile (person icon)
// Active tab: kAccent color label + icon; inactive: kTextSecondary
// Tab switch: NO animation delay — instant IndexedStack swap for 60fps feel
// Selected indicator: small dot above icon, kAccent, animated with AnimatedOpacity (200ms)
```

---

## Screen 2 — Results Screen

**Route:** `/results`
**Widget:** `ResultsScreen` — `StatelessWidget`
**Transition:** Custom `PageRouteBuilder` (see Transitions section)

### Layout

#### 1. AppBar
```dart
// Back button: Icons.arrow_back_ios_new, kTextPrimary
// Title: "Results" — titleLarge
// No elevation, kBackground bg
```

#### 2. Hero Risk Banner (top card)
```dart
// Hero(tag: 'risk-card') — matches Home screen hero tag
// Card: kAlertCard bg OR kGreenCard bg depending on risk level, radius 20
// "ANALYSIS COMPLETE" pill label — 11px uppercase, kAccentDeep, kSyncGreen bg

// Risk level headline — uses AnimatedSwitcher:
//   HIGH RISK → 38px Baloo 2 ExtraBold, kHighRisk color
//   MODERATE  → 32px, Color(0xFFFF9800)
//   LOW RISK  → 32px, Color(0xFF4CAF50)

// Subtext pill: "Insulin Resistant PCOS Indicator" — white bg, kAccentDeep text, icon
```

#### 3. "What this means" Card
```dart
// kPurpleCard bg, radius 20, padding 20
// Row: [bulb icon, kAccent] [title "What this means" — titleMedium]
// Below: body text — bodyLarge kTextPrimary
// Fade-in on screen mount: FadeTransition + SlideTransition (from bottom 20px), delay 200ms
```

#### 4. "What to do next" — Numbered Action List
```dart
// Section header: "WHAT TO DO NEXT" — labelSmall, uppercase, kTextSecondary
// Each item: StaggeredActionItem — animates in sequence with 100ms delay per item
// Item layout: Row[ numbered circle (kAccent bg, white num) | Column[title, subtitle] | illustration ]
// Card colors: kYellowCard (item 1), kGreenCard (item 2), white (item 3...)
// Tap: ripple only, no navigation (items are advisory)
```

**StaggeredActionItem — entry animation:**
```dart
// Each item fades in and slides up from 30px below
// Use AnimationController in initState, staggered via Future.delayed(Duration(milliseconds: index * 120))
// Curve: Curves.easeOutCubic, duration: 350ms
```

#### 5. Generate Report CTA
```dart
// Full-width button, kTextPrimary bg (near black), white text, radius 30
// Left icon: Icons.description_outlined
// Text: "Generate Detailed Report" — localized
// Tap: show CircularProgressIndicator overlay for 1.5s (simulate generation) then show SnackBar
```

#### 6. "Continue Tracking Symptoms" text button
```dart
// Center-aligned, kAccent color, underline, bodyMedium
// Tap → Navigator.pop(context)
```

---

## Screen 3 — Log Screen (Journal)

**Route:** `/log`
**Widget:** `LogScreen` — `StatefulWidget`

### Layout

#### 1. Header (NOT in AppBar — part of scroll body)
```dart
// Back arrow: top-left, Navigator.pop
// Date: "Oct 24" — displayLarge, kTextPrimary (use DateFormat('MMM d').format(DateTime.now()))
// Subtitle: "Your " + italic("body") + " today" — use RichText with TextSpan
//   "body" → fontStyle: FontStyle.italic, kAccent color, same Baloo 2 font
```

#### 2. Energy & Mood Selector Card
```dart
// Card: kPurpleCard bg, radius 20, padding 20
// Label: "Energy & Mood" — titleMedium
// 5 mood icons in a Row — use emoji Unicode: 😔 😕 😐 🙂 😊
// Each mood: GestureDetector, 40x40 container
// Selected state: white circle bg (AnimatedContainer, 200ms) + scale 1.2 (AnimatedScale)
// Deselected: transparent bg, scale 1.0
// Illustration: small ghost/creature SVG — use CustomPainter or Image.asset, positioned right side
```

#### 3. Symptoms & Sensations Card
```dart
// Card: kGreenCard bg, radius 20, padding 20
// Label: "Symptoms & Sensations"
// Wrap of FilterChip widgets:
//   Symptoms: Headache, Cramps, Fatigue, Bloating, Nausea, Backache, Insomnia (+ more)
//   Selected chip: kAccent bg, white text, checkmark
//   Unselected chip: white bg, kTextSecondary border (0.5px), kTextPrimary text
//   Chip animation: AnimatedContainer for bg color, 180ms, Curves.easeInOut
//   Chips are localized (see i18n section)
```

#### 4. Journal Notes TextField
```dart
// Section label: "JOURNAL NOTES" — labelSmall, uppercase, kTextSecondary
// TextField:
//   decoration: no border, hint text (localized, italic)
//   minLines: 4, maxLines: 8
//   keyboardType: TextInputType.multiline
//   style: bodyLarge, kTextPrimary
//   hint bottom-right: "Take a breath." — 12px, kTextSecondary, italic
//   Background: white with very subtle border
```

#### 5. Save Log CTA (fixed bottom, outside scroll)
```dart
// Positioned above system nav bar using SafeArea
// Full-width, kAccent bg, white text, radius 30
// Left icon: Icons.save_outlined
// Text: "Save Log" — localized
// Tap behavior:
//   1. Button animates to show CircularProgressIndicator (replace icon)
//   2. After 800ms: icon becomes Icons.check, color stays kAccent
//   3. After 400ms more: Navigator.pop + SnackBar "Log saved ✓"
//   4. Writes to Isar via SymptomRepository
```

---

## Page Transitions

```dart
// lib/app/router.dart — use GoRouter with custom transitions

GoRoute(
  path: '/results',
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const ResultsScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 380),
  ),
),

GoRoute(
  path: '/log',
  pageBuilder: (context, state) => CustomTransitionPage(
    child: const LogScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeIn),
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  ),
),
```

---

## Localization (i18n)

### Supported locales
```dart
supportedLocales: const [
  Locale('en'), Locale('hi'), Locale('mr'), Locale('kn'), Locale('te'),
],
```

### Key strings to localize (ARB format in lib/l10n/)
```json
// app_en.arb
{
  "greeting_morning": "Good morning,",
  "synced_just_now": "SYNCED JUST NOW",
  "syncing": "SYNCING",
  "elevated_risk": "ELEVATED RISK",
  "pcos_detected": "PCOS Flare-up Detected",
  "review_assessment": "Review Assessment",
  "todays_focus": "Today's Focus",
  "log_today": "Log today",
  "doctor_report": "Doctor report",
  "ask_ovya": "Ask Ovya",
  "my_history": "My history",
  "mindful_moment": "Mindful Moment",
  "results_title": "Results",
  "high_risk": "HIGH RISK",
  "moderate_risk": "MODERATE RISK",
  "low_risk": "LOW RISK",
  "what_this_means": "What this means",
  "what_to_do_next": "WHAT TO DO NEXT",
  "generate_report": "Generate Detailed Report",
  "continue_tracking": "Continue Tracking Symptoms",
  "your_body_today": "Your {style_body} today",
  "energy_mood": "Energy & Mood",
  "symptoms_sensations": "Symptoms & Sensations",
  "journal_notes": "JOURNAL NOTES",
  "journal_hint": "How are you feeling mentally and physically? Any specific triggers today...",
  "take_a_breath": "Take a breath.",
  "save_log": "Save Log",
  "symptom_headache": "Headache",
  "symptom_cramps": "Cramps",
  "symptom_fatigue": "Fatigue",
  "symptom_bloating": "Bloating",
  "symptom_nausea": "Nausea",
  "symptom_backache": "Backache",
  "symptom_insomnia": "Insomnia"
}
```

### Language switcher
```dart
// In Profile tab — SegmentedButton<Locale> with 5 options
// On change: ref.read(localeProvider.notifier).state = newLocale
// MaterialApp.router locale: ref.watch(localeProvider)
// Theme rebuilds automatically via buildTextTheme(locale)
// NO hot-reload required — all text updates reactively via AppLocalizations.of(context)
```

---

## Performance Rules (60fps guarantee)

```dart
// 1. NEVER use Column inside SingleChildScrollView — always CustomScrollView + Slivers
// 2. ALL cards must be const constructors where possible
// 3. SyncBadge, FocusCard, StaggeredActionItem — each is a separate widget file
//    (prevents parent rebuild from cascading)
// 4. RepaintBoundary around:
//    - SyncBadge (rotates independently)
//    - Each FocusCard illustration (CustomPainter if used)
// 5. IndexedStack for bottom nav — preserves scroll position, NO rebuild on tab switch
// 6. Image.asset for illustrations — use cacheWidth/cacheHeight to limit decode size
// 7. NO BoxShadow with blurRadius > 0 on list items — use colored borders instead
// 8. AnimationController must be disposed in dispose() — every single one
// 9. Use Riverpod's select() to subscribe to only the slice of state you need
//    e.g. ref.watch(userProvider.select((u) => u.name)) not ref.watch(userProvider)
// 10. GoogleFonts.config.allowRuntimeFetching = false — bundle fonts, no network fetch
```

---

## State Management (Riverpod)

```dart
// Providers needed:
final localeProvider    = StateProvider<Locale>((ref) => const Locale('en'));
final userProvider      = StateNotifierProvider<UserNotifier, UserState>(...);
final riskProvider      = FutureProvider<PCOSRiskScore>((ref) => ...); // from DetectionEngine
final syncStatusProvider = StreamProvider<SyncStatus>((ref) => ...);   // from SyncService
final selectedMoodProvider = StateProvider<int?>((ref) => null);        // 0-4
final selectedSymptomsProvider = StateProvider<Set<String>>((ref) => {}); 

// SanctuaryScreen watches:
//   ref.watch(userProvider.select((u) => u.name))
//   ref.watch(riskProvider)
//   ref.watch(syncStatusProvider)

// LogScreen watches:
//   ref.watch(selectedMoodProvider)
//   ref.watch(selectedSymptomsProvider)
```

---

## File Structure

```
lib/
├── app/
│   ├── router.dart          ← GoRouter with all routes + transitions
│   └── theme.dart           ← ThemeData, colors, buildTextTheme(locale)
├── features/
│   ├── sanctuary/
│   │   ├── sanctuary_screen.dart
│   │   ├── widgets/
│   │   │   ├── sync_badge.dart        ← RepaintBoundary, AnimationController
│   │   │   ├── focus_card.dart        ← AnimatedScale on press
│   │   │   ├── risk_alert_card.dart   ← Hero widget
│   │   │   └── mindful_moment_card.dart
│   ├── results/
│   │   ├── results_screen.dart
│   │   └── widgets/
│   │       ├── risk_banner.dart       ← Hero widget (matches)
│   │       └── staggered_action_item.dart
│   └── log/
│       ├── log_screen.dart
│       └── widgets/
│           ├── mood_selector.dart
│           └── symptom_chip_grid.dart
└── shared/
    └── widgets/
        └── ovya_button.dart           ← reusable CTA button with loading state
```

---

## Build this screen by screen in this order:
1. `theme.dart` + `router.dart` skeleton
2. `SanctuaryScreen` (Home) — all widgets
3. `ResultsScreen`
4. `LogScreen`
5. Wire Riverpod providers
6. Add localization strings for all 5 languages
7. Test scroll smoothness — run in profile mode: `flutter run --profile`

---

## DO NOT:
- Use `SingleChildScrollView` + `Column` for any scrollable screen
- Use `BoxShadow` with blurRadius > 4 on repeated list items
- Use `setState` at the screen level for animation state — use AnimationController
- Fetch Google Fonts at runtime (`allowRuntimeFetching = false`)
- Use the default `PageRoute` (MaterialPageRoute) — always use `CustomTransitionPage`
- Hardcode any user-facing string — every string goes through AppLocalizations
