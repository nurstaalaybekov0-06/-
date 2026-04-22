import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.title,
    required this.price,
    required this.location,
    required this.time,
    required this.isNegotiable,
    required this.description,
    required this.category,
    required this.themeColors,
    this.imageAsset,
  });

  final String title;
  final String price;
  final String location;
  final String time;
  final bool isNegotiable;
  final String description;
  final String category;
  final List<Color> themeColors;
  final String? imageAsset;
}
