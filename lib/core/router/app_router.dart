import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baybe_app/features/home/presentetaion/home_page.dart';
import 'package:baybe_app/features/settings/presentetaion/settings_page.dart';

import '../../features/detail/presentetaion/detail_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(title: 'Home'),
        routes: [
          GoRoute(
            path: 'detail/:id',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return DetailPage(url: id);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
});
