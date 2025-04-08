/*
SaleCategoryListView:
list to view all categories on sale products
 */

import 'package:flutter/material.dart';

class SaleCategoryListView extends StatelessWidget {
  const SaleCategoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return TextButton(
              onPressed: () {
                //todo: navigate
              },
              style: ButtonStyle(
                //todo: back to change the state
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(categories[index]),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
        ),
      ),
    );
  }
}

//todo must be replaced

final categories = ["All", "Newest", "Popular", "Man", "Women"];
