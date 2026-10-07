import 'package:baybe_app/core/widgets/app_scaffold.dart';
import 'package:baybe_app/features/detail/application/detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.contentId});

  final String contentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailProvider);
    final items = <Widget>[];
    items.add(Text('タイトル ${state.title}'));
    items.add(Image.network(state.imageUrl));
    return AppScaffold(
      title: 'detail',
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...items,
          ],
        ),
      ),
    );
  }
}
