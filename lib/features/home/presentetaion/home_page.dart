import 'package:baybe_app/core/widgets/app_scaffold.dart';
import 'package:baybe_app/core/widgets/thumbnail_row.dart';
import 'package:baybe_app/features/home/application/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final items = <Widget>[];
    for (int s = 0; s < state.sliderInfo.length; s++) {
      final sliderInfo = state.sliderInfo[s];
      items.add(Text('項目 ${sliderInfo.title}'));
      items.add(
        ThumbnailRow(
          videoThumbnails: sliderInfo.videoThumbnails,
          onTap: (index) => context.push('/detail/$index'),
        ),
      );
    }
    return AppScaffold(
      title: title,
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...items,
              ],
            ),
    );
  }
}
