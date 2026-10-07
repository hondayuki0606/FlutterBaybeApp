import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'detail_state.dart';

class DetailNotifier extends Notifier<DetailState> {
  @override
  DetailState build() {
    Future.microtask(load);
    return const DetailState();
  }

  Future<void> load() async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(
      title: 'スライダー①のコンテンツ１',
      imageUrl:  'https://picsum.photos/200/300',
      sliderInfo: const [
        // SliderInfo(
        //   title: 'スライダー①',
        //   videoThumbnails: [
        //     VideoThumbnail(
        //       imageUrl: 'https://picsum.photos/200/300',
        //     ),
        //     VideoThumbnail(
        //       imageUrl: 'https://picsum.photos/200/300',
        //     ),
        //   ],
        // ),
        // SliderInfo(
        //   title: 'スライダー②',
        //   videoThumbnails: [
        //     VideoThumbnail(
        //       imageUrl: 'https://picsum.photos/200/300',
        //     ),
        //     VideoThumbnail(
        //       imageUrl: 'https://picsum.photos/200/300',
        //     ),
        //   ],
        // ),
      ],
      isLoading: false,
    );
  }

  void select(int index) {
    // state = state.copyWith(selectedIndex: index);
  }
}

final detailProvider =
NotifierProvider<DetailNotifier, DetailState>(DetailNotifier.new);
