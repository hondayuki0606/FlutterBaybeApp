import 'package:baybe_app/features/home/application/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeNotifier extends Notifier<HomeState> {
  @override
  HomeState build() {
    Future.microtask(load);
    return const HomeState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      sliderInfo: const [
        SliderInfo(
          title: 'スライダー①',
          videoThumbnails: [
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
      ],
      isLoading: false,
    );
  }

  void select(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}

final homeProvider =
NotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);
