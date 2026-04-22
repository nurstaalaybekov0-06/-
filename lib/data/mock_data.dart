import 'package:flutter/material.dart';
import 'package:lesson_1/models/category_item.dart';
import 'package:lesson_1/models/product.dart';

class MockData {
  static const categories = [
    CategoryItem(
      title: 'Одежда',
      icon: Icons.checkroom_rounded,
      imageAsset: 'assets/images/categories/clothes.png',
      imageWidth: 44,
      imageHeight: 44,
    ),
    CategoryItem(
      title: 'Недвижимость',
      icon: Icons.house_rounded,
      imageAsset: 'assets/images/categories/home_tools.png',
      imageWidth: 44,
      imageHeight: 44,
    ),
    CategoryItem(
      title: 'Электроника',
      icon: Icons.phone_iphone_rounded,
      imageAsset: 'assets/images/categories/electronics.png',
      imageWidth: 44,
      imageHeight: 44,
    ),
    CategoryItem(
      title: 'Все для дома',
      icon: Icons.handyman_rounded,
      imageAsset: 'assets/images/categories/house.png',
      imageWidth: 44,
      imageHeight: 44,
    ),
  ];

  static const products = [
    Product(
      title: 'Наушники Beats by Dre',
      price: '400 000 ₸',
      location: 'Алматы',
      time: 'Сегодня, 15:30',
      isNegotiable: true,
      category: 'Электроника',
      imageAsset: 'assets/images/products/headphones.jpg',
      description:
          'Эти наушники — верный спутник в мире звука и стиля. С их элегантным '
          'дизайном и превосходным качеством звучания вы погружаетесь в '
          'музыкальный опыт нового уровня. Наушники идеально сбалансированы '
          'между комфортом и функциональностью, обеспечивая чистоту звука и '
          'ясные высокие частоты.',
      themeColors: [
        Color(0xFF17181E),
        Color(0xFF42434D),
        Color(0xFFF15A31),
        Color(0xFFE43F7B),
      ],
    ),
    Product(
      title: 'Очки Prada',
      price: '80 000 ₸',
      location: 'Алматы',
      time: 'Сегодня, 15:30',
      isNegotiable: true,
      category: 'Одежда',
      imageAsset: 'assets/images/products/glasses.jpg',
      description:
          'Стильная оправа с выразительной геометрией. Легкие материалы и '
          'комфортная посадка делают эту модель удачным выбором на каждый день.',
      themeColors: [
        Color(0xFF1B1A1C),
        Color(0xFF676972),
        Color(0xFFB47B4F),
        Color(0xFFE8E5E0),
      ],
    ),
  ];
}
