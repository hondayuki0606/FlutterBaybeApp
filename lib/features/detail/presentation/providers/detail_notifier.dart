import 'package:baybe_app/features/detail/presentation/providers/detail_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailNotifier
    extends AutoDisposeFamilyAsyncNotifier<DetailState, String> {
  @override
  Future<DetailState> build(String arg) => _fetch(arg);

  Future<DetailState> _fetch(String contentId) async {
    await Future.delayed(const Duration(seconds: 2));
    return DetailState(
      title: '詳細画面 $contentId',
      imageUrl: 'https://picsum.photos/seed/320/180',
      sliderInfo: const [],
    );
  }

  Future<void> reload() async {
    if (state.isLoading) return;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetch(arg));
  }
}

final detailProvider = AsyncNotifierProvider.autoDispose
    .family<DetailNotifier, DetailState, String>(DetailNotifier.new);
