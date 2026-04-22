import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        children: [
          SizedBox(width: 18),
          Icon(Icons.search_rounded, size: 32, color: Colors.white70),
          SizedBox(width: 12),
          Text(
            'Введите название товара',
            style: TextStyle(
              color: AppColors.subtleText,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
