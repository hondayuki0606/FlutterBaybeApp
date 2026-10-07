class BatteryStatus {
  const BatteryStatus({required this.level});

  final int level; // 0〜100

  bool get isLow => level <= 20;
}