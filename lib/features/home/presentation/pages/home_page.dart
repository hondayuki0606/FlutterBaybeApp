import 'package:baybe_app/core/widgets/app_scaffold.dart';
import 'package:baybe_app/core/widgets/thumbnail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/home_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    return state.when(
      data: (state) => AppScaffold(
        title: title,
        body: Column(
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
      ),
      error: (e, st) => Text('$e'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
