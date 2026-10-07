import 'package:baybe_app/features/battery/data/datasources/battery_platform_datasource.dart';
import 'package:baybe_app/features/battery/domain/repositories/battery_repository.dart';
import 'package:flutter/services.dart';

class BatteryRepositoryImpl implements BatteryRepository {
  const BatteryRepositoryImpl(this._dataSource);

  final BatteryPlatformDataSource _dataSource;

  @override
  Future<int> getBatteryLevel() async {
    try {
      return await _dataSource.getBatteryLevel();
    } on PlatformException catch (e) {
      throw Exception('取得失敗: ${e.message}');
    }
  }
}
