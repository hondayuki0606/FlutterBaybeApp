import 'package:flutter/cupertino.dart';

class ThumbnailRow extends StatelessWidget {
  const ThumbnailRow({super.key, required this.urls});

  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: urls.length,
          separatorBuilder: (_, __) => const SizedBox(
            width: 12,
          ),
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  urls[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) =>
                  progress == null ? child : const Center(child: CupertinoActivityIndicator()),
                  errorBuilder: (context, error, stack) =>
                  const Center(child: Icon(CupertinoIcons.exclamationmark_triangle)),
                ),
              ),
            );
          },
        ));
  }
}
