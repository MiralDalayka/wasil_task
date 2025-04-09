import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';
import 'package:wasil_flutter_task/features/product/presentation/screens/products_details_screen.dart';
import '../../blocs/products_cubit.dart';
import 'product_card.dart';

class FlashProductsView extends StatelessWidget {
  FlashProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = serviceLocator<ProductsCubit>();
        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: cubit.productsWatchList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:
                  () => AppRouter.push(
                    screen: ProductDetailsScreen(
                      product: cubit.productsWatchList[index],
                    ),
                  ),
              child: ProductCard(product: cubit.productsWatchList[index]),
            );
          },
        );
      },
    );
  }
}
