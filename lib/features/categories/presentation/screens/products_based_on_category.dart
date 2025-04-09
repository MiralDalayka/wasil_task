import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/features/cart/presentation/screens/widgets/cart_icon_widget.dart';
import 'package:wasil_flutter_task/features/product/presentation/blocs/products_cubit.dart'
    show
        ProductsCubit,
        ProductsError,
        ProductsFiltered,
        ProductsLoading,
        ProductsStates,
        ProductsSuccess;

import '../../../product/presentation/widgets/products_view_home_screen_widgets/product_card.dart';

class ProductsBasedOnCategory extends StatelessWidget {
  const ProductsBasedOnCategory({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [CartIconWidget()],
      ),
      body: BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
          final products = serviceLocator<ProductsCubit>().filterProducts(
            category: categoryName.toLowerCase(),
          );
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductsFiltered) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                mainAxisSpacing: 3,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            );
          } else if (state is ProductsError) {
            return Center(child: Text("Something went wrong"));
          } else {
            return Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
