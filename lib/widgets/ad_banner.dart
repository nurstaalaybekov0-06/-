import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: Text(
              'Реклама',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Positioned(
            left: 0,
            top: 54,
            child: Text(
              'ЗДЕСЬ МОГЛА БЫТЬ\nВАША РЕКЛАМА',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IgnorePointer(
              child: Padding(
                padding: const EdgeInsets.only(right: 2, top: 6),
                child: Opacity(
                  opacity: 0.72,
                  child: SizedBox(
                    width: 132,
                    height: 132,
                    child: Image.asset(
                      'assets/images/banner/megaphone.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
