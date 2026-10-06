import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:baybe_app/core/widgets/thumbnail_row.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('detail'),
            ThumbnailRow(urls: [url]),
          ],
        ),
      ),
    );
  }
}
