
import 'package:baybe_app/core/domain/entities/video_thumbnail.dart';

class SliderInfo {
  const SliderInfo({
    this.title = '',
    this.videoThumbnails = const [],
  });

  final String title;
  final List<VideoThumbnail> videoThumbnails;
}
