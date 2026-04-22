import 'package:flutter/material.dart';
import 'package:lesson_1/data/mock_data.dart';
import 'package:lesson_1/core/theme/app_colors.dart';
import 'package:lesson_1/screens/product_details_screen.dart';
import 'package:lesson_1/widgets/ad_banner.dart';
import 'package:lesson_1/widgets/categories_row.dart';
import 'package:lesson_1/widgets/location_header.dart';
import 'package:lesson_1/widgets/product_card.dart';
import 'package:lesson_1/widgets/search_field.dart';
import 'package:lesson_1/widgets/status_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredProduct = MockData.products.first;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusBarWidget(),
              const SizedBox(height: 26),
              const LocationHeader(),
              const SizedBox(height: 24),
              const SearchFieldWidget(),
              const SizedBox(height: 22),
              const AdBanner(),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 60,
                  child: Divider(
                    height: 2,
                    thickness: 6,
                    color: AppColors.softCard,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('Категории', style: Theme.of(context).textTheme.titleLarge),
                  const Spacer(),
                  const Text(
                    'Посмотреть все',
                    style: TextStyle(
                      color: AppColors.accent,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              CategoriesRow(items: MockData.categories),
              const SizedBox(height: 28),
              Text(
                'Рекомендации',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 18),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.56,
                ),
                itemBuilder: (context, index) {
                  final current = MockData.products[index.isEven ? 0 : 1];
                  return ProductCard(
                    product: current,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              ProductDetailsScreen(product: featuredProduct),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
