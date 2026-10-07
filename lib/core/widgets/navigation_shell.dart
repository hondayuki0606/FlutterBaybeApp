import 'package:baybe_app/features/home/presentation/providers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NavigationShell extends ConsumerWidget {
  const NavigationShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          debugPrint('tab: $index, current: ${navigationShell.currentIndex}');
          if (index == 0 && navigationShell.currentIndex != 0) {
            debugPrint('reload home');
            ref.read(homeProvider.notifier).reload();
          }
          navigationShell.goBranch(
            index,
            // すでに表示中のタブを押したら、そのタブの最初の画面に戻る
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'ホーム',
          ),
          NavigationDestination(
            icon: Icon(Icons.battery_0_bar_outlined),
            selectedIcon: Icon(Icons.battery_0_bar),
            label: 'バッテリー',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
      ),
    );
  }
}
