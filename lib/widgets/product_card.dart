import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';
import 'package:lesson_1/models/product.dart';
import 'package:lesson_1/widgets/product_artwork.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.1,
                  child: ProductArtwork(
                    colors: product.themeColors,
                    imageAsset: product.imageAsset,
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: _FavoriteBubble(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              product.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    product.price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (product.isNegotiable) ...[
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'Договорная',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Text(
              product.location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.accent,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.time,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteBubble extends StatelessWidget {
  const _FavoriteBubble();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.favorite_border_rounded,
        size: 18,
        color: Colors.white,
      ),
    );
  }
}
