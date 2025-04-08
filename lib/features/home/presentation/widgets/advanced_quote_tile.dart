import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';

class AdvancedQuoteTile extends StatefulWidget {
  final ProductEntity product;
  const AdvancedQuoteTile({super.key, required this.product});

  @override
  State<AdvancedQuoteTile> createState() => _AdvancedQuoteTileState();
}

class _AdvancedQuoteTileState extends State<AdvancedQuoteTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            //TODO navigate to products detailes
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          ),
        ),
      ],
    );
  }
}
