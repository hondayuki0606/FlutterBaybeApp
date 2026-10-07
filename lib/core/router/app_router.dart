import 'package:baybe_app/core/widgets/navigation_shell.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baybe_app/features/home/presentation/pages/home_page.dart';
import 'package:baybe_app/features/settings/presentation/pages/settings_page.dart';
import 'package:baybe_app/features/battery/presentation/pages/battery_page.dart';
import 'package:baybe_app/features/detail/presentation/pages/detail_page.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/home',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              NavigationShell(navigationShell: navigationShell),
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/home',
                  builder: (context, state) => const HomePage(title: 'Home'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/battery',
                  builder: (context, state) => const BatteryPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/detail/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return DetailPage(contentId: id);
          },
        ),
      ],
    );
  },
);
