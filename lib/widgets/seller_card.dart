import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 62,
            height: 62,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.asset(
              'assets/images/sellers/seller.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Иванов Иван',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.star_rounded, color: AppColors.accent, size: 22),
                    SizedBox(width: 6),
                    Text(
                      'Отзывы ',
                      style: TextStyle(
                        color: AppColors.subtleText,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '(20)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: Colors.white,
            size: 34,
          ),
        ],
      ),
    );
  }
}
