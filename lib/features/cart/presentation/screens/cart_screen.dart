import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/core/common/widgets/sections/soon_page.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';

import '../../../../app/get_it/get_it.dart';
import '../bloc/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = serviceLocator<CartCubit>();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: const Text("Your Cart")),
      body: SafeArea(
        // Wrap your body in a SafeArea
        child: BlocBuilder<CartCubit, CartStates>(
          bloc: cartCubit,
          builder: (context, state) {
            final cartItems = cartCubit.items;

            if (cartItems.isEmpty) {
              return const Center(child: Text("Your cart is empty"));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final product = cartItems.keys.elementAt(index);
                      final quantity = cartItems[product]!;
                      final totalPrice = (product.price * quantity)
                          .toStringAsFixed(2);

                      return ListTile(
                        leading: Image.network(
                          product.images.first,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.title),
                        subtitle: Text(
                          "Price: \$${product.price} x $quantity = \$${totalPrice}",
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed:
                                  () => cartCubit.decreaseQuantity(product),
                            ),
                            Text('$quantity'),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed:
                                  () => cartCubit.increaseQuantity(product),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${cartCubit.totalPrice.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            serviceLocator<AuthCubit>().authMode(SoonPage());

                            // cartCubit.checkout(); // Logic to process checkout
                            // Navigator.pop(
                            //   context,
                            // ); // Optional: go back or to a confirmation screen
                          },
                          child: const Text("Checkout"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      resizeToAvoidBottomInset:
          false, // Keep this to avoid layout issues with the bottom nav bar
    );
  }
}
