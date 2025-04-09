/*
CategoryListView: TO view all categories as circular icon and name
 */
import 'package:flutter/material.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';
import 'package:wasil_flutter_task/features/categories/presentation/screens/products_based_on_category.dart';

import '../../temp_static_data.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                AppRouter.push(
                  screen: ProductsBasedOnCategory(categoryName: category.name),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(category.assetImage, width: 35, height: 35),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 20);
          },
        ),
      ),
    );
  }
}
