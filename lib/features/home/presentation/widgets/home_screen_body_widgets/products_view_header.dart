import 'package:flutter/material.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';
import 'package:wasil_flutter_task/features/product/presentation/blocs/products_cubit.dart';

import '../../../../product/domain/entities/sotring_filtering_enums.dart';
import '../../screens/home_screen.dart';

class ProductsViewHeader extends StatelessWidget {
  const ProductsViewHeader({super.key});

  void _sortProducts(BuildContext context, SortBy sortBy, bool ascending) {
    serviceLocator<ProductsCubit>().sortProducts(
      sortBy: sortBy,
      ascending: ascending,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Products"),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'price') {
                _sortProducts(
                  context,
                  SortBy.price,
                  true,
                ); // Sort by price ascending
              } else if (value == 'price_desc') {
                _sortProducts(
                  context,
                  SortBy.price,
                  false,
                ); // Sort by price descending
              } else if (value == 'category') {
                _sortProducts(
                  context,
                  SortBy.category,
                  true,
                ); // Sort by category ascending
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'price',
                    child: Text('Sort by Price'),
                  ),
                  PopupMenuItem<String>(
                    value: 'price_desc',
                    child: Text('Sort by Price (Descending)'),
                  ),
                  PopupMenuItem<String>(
                    value: 'category',
                    child: Text('Sort by Category'),
                  ),
                ],
            icon: Icon(Icons.sort),
          ),
        ],
      ),
    );
  }
}
