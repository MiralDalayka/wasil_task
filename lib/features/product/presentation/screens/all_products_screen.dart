import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/features/cart/presentation/screens/widgets/cart_icon_widget.dart';
import '../blocs/products_cubit.dart';
import '../widgets/products_view_home_screen_widgets/product_card.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [CartIconWidget()],
      ),
      body: BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            final products = serviceLocator<ProductsCubit>().allProducts;
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
          }
        },
      ),
    );
  }
}
