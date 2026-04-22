import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';

class LocationHeader extends StatelessWidget {
  const LocationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.location_on_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
        const SizedBox(width: 14),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.white),
            children: [
              TextSpan(text: 'Ваш город: '),
              TextSpan(
                text: 'Сеул',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.notifications_none_rounded,
          color: Colors.white,
          size: 32,
        ),
      ],
    );
  }
}
