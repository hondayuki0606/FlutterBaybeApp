// lib/features/battery/presentation/providers/battery_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/battery_platform_datasource.dart';
import '../../data/repositories/battery_repository_impl.dart';
import '../../domain/entities/battery_status.dart';
import '../../domain/repositories/battery_repository.dart';
import '../../domain/usecase/get_battery_level_usecase.dart';

final batteryRepositoryProvider = Provider<BatteryRepository>(
      (ref) => BatteryRepositoryImpl(BatteryPlatformDataSource()),
);

final getBatteryLevelUseCaseProvider = Provider<GetBatteryLevelUseCase>(
      (ref) => GetBatteryLevelUseCase(ref.watch(batteryRepositoryProvider)),
);

final batteryStatusProvider = FutureProvider.autoDispose<BatteryStatus>(
      (ref) => ref.watch(getBatteryLevelUseCaseProvider)(),
);