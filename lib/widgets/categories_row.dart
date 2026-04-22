import 'package:flutter/material.dart';
import 'package:lesson_1/core/theme/app_colors.dart';
import 'package:lesson_1/models/category_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key, required this.items});

  final List<CategoryItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items
          .map(
            (item) => SizedBox(
              width: 74,
              child: Column(
                children: [
                  Container(
                    width: 74,
                    height: 74,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: item.imageAsset != null
                        ? Center(
                            child: SizedBox(
                              width: item.imageWidth ?? 44,
                              height: item.imageHeight ?? 44,
                              child: Image.asset(
                                item.imageAsset!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : Icon(item.icon, color: AppColors.card, size: 38),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
