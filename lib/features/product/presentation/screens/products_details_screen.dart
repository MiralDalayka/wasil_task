import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import '../../../cart/presentation/bloc/cart_cubit.dart';
import '../../../cart/presentation/screens/widgets/cart_icon_widget.dart';
import '../../domain/entities/product_entity.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [CartIconWidget()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                ),
                items:
                    product.images.map((url) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
              ),
              const Gap(16),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(8),
              Text(product.description),
              const Gap(16),

              // Price and Quantity Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.price}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.green),
                  ),
                  const Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) setState(() => quantity--);
                        },
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () => setState(() => quantity++),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xCDe0c3f6)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailRow('Category:', product.category),
                    _buildDetailRow('Brand:', product.brand),
                    _buildDetailRow(
                      'Dimensions:',
                      'Width: ${product.dimensions.width} cm,\nHeight: ${product.dimensions.height} cm,\n Depth: ${product.dimensions.depth} cm',
                    ),
                    _buildDetailRow('Shipping:', product.shippingInformation),
                    _buildDetailRow(
                      'Availability:',
                      product.availabilityStatus,
                    ),
                  ],
                ),
              ),

              const Gap(20),

              // Add to Cart Button
              ElevatedButton.icon(
                onPressed: () {
                  serviceLocator<CartCubit>().addToCart(product, quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Product added to cart!")),
                  );
                  setState(() {
                    quantity = 1;
                  });
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  textStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create rows for product details
  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
