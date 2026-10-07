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
