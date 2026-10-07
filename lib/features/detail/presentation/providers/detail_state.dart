import '../../../../core/domain/entities/slider_info.dart';

class DetailState {
  const DetailState({
    this.title = '',
    this.imageUrl = '',
    this.sliderInfo = const [],
    this.isLoading = false,
  });

  final String title;
  final String imageUrl;
  final List<SliderInfo> sliderInfo;
  final bool isLoading;

  DetailState copyWith({
    String? title,
    String? imageUrl,
    List<SliderInfo>? sliderInfo,
    bool? isLoading,
  }) {
    return DetailState(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      sliderInfo: sliderInfo ?? this.sliderInfo,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
