// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/features/product/domain/entities/product_entity.dart';
import '../../../../../core/common/services/router/app_router.dart';
import '../../screens/products_details_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouter.push(screen: ProductDetailsScreen(product: product));
      },
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE0C3F6).withOpacity(0.6)),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 150),
              child: Image.network(
                product.images.first,
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: Icon(Icons.image, size: 100));
                },
              ),
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.green[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(5.0),
            Text(
              product.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
