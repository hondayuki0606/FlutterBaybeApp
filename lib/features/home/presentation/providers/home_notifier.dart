import 'package:baybe_app/core/domain/entities/slider_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baybe_app/core/domain/entities/video_thumbnail.dart';
import 'home_state.dart';

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    final sliders = await _fetch();
    return HomeState(sliderInfo: sliders);
  }

  Future<List<SliderInfo>> _fetch() async {
    await Future.delayed(const Duration(seconds: 2));
    return const [
      SliderInfo(
        title: 'スライダー①',
        videoThumbnails: [
          VideoThumbnail(
            imageUrl: 'https://picsum.photos/200/300',
          ),
          VideoThumbnail(
            imageUrl: 'https://picsum.photos/200/300',
          ),
          VideoThumbnail(
            imageUrl: 'https://picsum.photos/200/300',
          ),
        ],
      ),
      SliderInfo(
        title: 'スライダー②',
        videoThumbnails: [
          VideoThumbnail(
            imageUrl: 'https://picsum.photos/200/300',
          ),
          VideoThumbnail(
            imageUrl: 'https://picsum.photos/200/300',
          ),
        ],
      ),
    ];
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final sliders = await _fetch();
      return HomeState(sliderInfo: sliders);
    });
  }
}

final homeProvider = AsyncNotifierProvider<HomeNotifier, HomeState>(
    HomeNotifier.new);
