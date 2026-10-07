import 'package:baybe_app/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:baybe_app/core/widgets/thumbnail_row.dart';
import 'package:baybe_app/features/detail/presentation/providers/detail_notifier.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.contentId});

  final String contentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailProvider(contentId));
    return state.when(
      data: (state) => AppScaffold(
        title: state.title,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(state.imageUrl),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (final slider in state.sliderInfo) ...[
                  ThumbnailRow(
                    videoThumbnails: slider.videoThumbnails,
                    onTap: (index) => context.push('/detail/$index'),
                  )
                ],
              ],
            ),
          ],
        ),
      ),
      error: (e, st) => Text('$e'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
