import 'package:baybe_app/core/scroll/snap_scroll_physics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/entities/video_thumbnail.dart';

class ThumbnailRow extends StatelessWidget {
  const ThumbnailRow({super.key, required this.videoThumbnails, this.onTap});

  final List<VideoThumbnail> videoThumbnails;
  final void Function(int index)? onTap;
  static const _height = 120.0;
  static const _gap = 12.0;
  static const _aspectRatio = 16 / 9;
  static const _itemWidth = _height * _aspectRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const SnapScrollPhysics(itemExtent: _itemWidth + _gap),
        itemCount: videoThumbnails.length,
        separatorBuilder: (_, __) => const SizedBox(width: _gap),
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: _aspectRatio,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: onTap == null ? null : () => onTap!(index),
              child: Image.network(
                videoThumbnails[index].imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) => progress == null
                    ? child
                    : const Center(child: CupertinoActivityIndicator()),
                errorBuilder: (context, error, stack) => const Center(
                    child: Icon(CupertinoIcons.exclamationmark_triangle)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
