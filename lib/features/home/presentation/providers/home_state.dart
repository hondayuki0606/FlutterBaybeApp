import '../../../../core/domain/entities/slider_info.dart';

class HomeState {
  const HomeState({
    this.sliderInfo = const [],
    this.selectedIndex = 0,
    this.isLoading = false,
  });

  final List<SliderInfo> sliderInfo;
  final int selectedIndex;
  final bool isLoading;

  HomeState copyWith({
    List<SliderInfo>? sliderInfo,
    int? selectedIndex,
    bool? isLoading,
  }) {
    return HomeState(
      sliderInfo: sliderInfo ?? this.sliderInfo,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
