import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';
import 'package:lesson_1/models/product.dart';
import 'package:lesson_1/widgets/carousel_dots.dart';
import 'package:lesson_1/widgets/overlay_circle_action.dart';
import 'package:lesson_1/widgets/product_artwork.dart';
import 'package:lesson_1/widgets/seller_card.dart';
import 'package:lesson_1/widgets/status_bar.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 470,
                    width: double.infinity,
                    child: ProductArtwork(
                      colors: product.themeColors,
                      imageAsset: product.imageAsset,
                      rounded: false,
                    ),
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.36),
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.18),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 16,
                    left: 24,
                    right: 24,
                    child: StatusBarWidget(),
                  ),
                  Positioned(
                    top: 56,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 64,
                    right: 68,
                    child: OverlayCircleAction(icon: Icons.favorite_border),
                  ),
                  const Positioned(
                    top: 64,
                    right: 20,
                    child: OverlayCircleAction(icon: Icons.ios_share_rounded),
                  ),
                  const Positioned(
                    bottom: 26,
                    left: 0,
                    right: 0,
                    child: CarouselDots(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          product.price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (product.isNegotiable)
                          const Padding(
                            padding: EdgeInsets.only(bottom: 4),
                            child: Text(
                              'Договорная',
                              style: TextStyle(
                                color: AppColors.accent,
                                fontSize: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Описание',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        '${product.description} Идеальный выбор для тех, кто ценит '
                        'каждую ноту и стремится к идеальному звучанию в любой '
                        'обстановке.',
                        style: const TextStyle(
                          color: AppColors.white70,
                          fontSize: 15,
                          height: 1.45,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Продавец',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    const SellerCard(),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.accent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 14,
                          shadowColor: AppColors.accent.withValues(alpha: 0.45),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Связаться с продавцом',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Center(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.card,
                          foregroundColor: Colors.redAccent,
                          side: BorderSide.none,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.warning_amber_rounded),
                        label: const Text('Пожаловаться'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
