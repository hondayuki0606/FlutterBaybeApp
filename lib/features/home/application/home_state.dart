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

class SliderInfo {
  const SliderInfo({
    this.title = '',
    this.videoThumbnails = const [],
  });

  final String title;
  final List<VideoThumbnail> videoThumbnails;
}

class VideoThumbnail {
  const VideoThumbnail({
    this.imageUrl = '',
  });

  final String imageUrl;
}
