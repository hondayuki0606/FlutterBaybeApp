import '../entities/battery_status.dart';
import '../repositories/battery_repository.dart';

class GetBatteryLevelUseCase {
  const GetBatteryLevelUseCase(this._repository);

  final BatteryRepository _repository;

  Future<BatteryStatus> call() async {
    final level = await _repository.getBatteryLevel();

    if (level < 0 || level > 100) {
      throw const BatteryUnavailableException();
    }
    return BatteryStatus(level: level);
  }
}

class BatteryUnavailableException implements Exception {
  const BatteryUnavailableException();

  @override
  String toString() => 'バッテリー残量を取得できません';
}