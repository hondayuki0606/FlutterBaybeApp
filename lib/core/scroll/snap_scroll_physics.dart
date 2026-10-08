import 'package:flutter/material.dart';

class SnapScrollPhysics extends ScrollPhysics {
  const SnapScrollPhysics({required this.itemExtent, super.parent});

  /// カード幅 + カード間の余白
  final double itemExtent;

  @override
  SnapScrollPhysics applyTo(ScrollPhysics? ancestor) =>
      SnapScrollPhysics(itemExtent: itemExtent, parent: buildParent(ancestor));

  double _targetPixels(ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = position.pixels / itemExtent;
    // 勢いがあるときは進行方向の次のカードへ
    if (velocity < -tolerance.velocity) {
      page -= 0.5;
    } else if (velocity > tolerance.velocity) {
      page += 0.5;
    }
    return (page.roundToDouble() * itemExtent)
        .clamp(position.minScrollExtent, position.maxScrollExtent);
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    // 端を超えているときは標準の挙動に任せる
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final tolerance = toleranceFor(position);
    final target = _targetPixels(position, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}