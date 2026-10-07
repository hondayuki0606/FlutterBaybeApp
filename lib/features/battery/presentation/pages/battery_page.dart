import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/battery_provider.dart';

class BatteryPage extends ConsumerWidget {
  const BatteryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncStatus = ref.watch(batteryStatusProvider);

    return asyncStatus.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('$e')),
      data: (status) => Center(
        child: Text(
          '残量 ${status.level}%${status.isLow ? '(低下中)' : ''}',
        ),
      ),
    );
  }
}