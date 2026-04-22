import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';

class CarouselDots extends StatelessWidget {
  const CarouselDots({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: index == 0 ? AppColors.accent : Colors.white38,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
