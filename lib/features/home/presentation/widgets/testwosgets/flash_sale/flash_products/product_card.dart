import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double rating;
  final double price;
  final VoidCallback onLoveButtonPressed;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.productName,
    required this.rating,
    required this.price,
    required this.onLoveButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details page
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.transparent, // Transparent background
        child: Wrap(
          children: [
            Container(
              width: double.infinity,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: onLoveButtonPressed,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(productName),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow),
                        Text(rating.toString()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('\$${price.toStringAsFixed(2)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
