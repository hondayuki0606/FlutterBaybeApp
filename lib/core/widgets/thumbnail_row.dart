import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThumbnailRow extends StatelessWidget {
  const ThumbnailRow({super.key, required this.urls, this.onTap});

  final List<String> urls;
  final void Function(int index)? onTap;

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
              child: InkWell(
                onTap: onTap == null ? null : () => onTap!(index),
                child: Image.network(
                  urls[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) => progress == null
                      ? child
                      : const Center(child: CupertinoActivityIndicator()),
                  errorBuilder: (context, error, stack) => const Center(
                      child: Icon(CupertinoIcons.exclamationmark_triangle)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
