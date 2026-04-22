import 'package:flutter/material.dart';

class CategoryItem {
  const CategoryItem({
    required this.title,
    required this.icon,
    this.imageAsset,
    this.imageWidth,
    this.imageHeight,
    this.imageTop,
    this.imageLeft,
  });

  final String title;
  final IconData icon;
  final String? imageAsset;
  final double? imageWidth;
  final double? imageHeight;
  final double? imageTop;
  final double? imageLeft;
}
