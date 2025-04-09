/*
HomeSearchBar: to find items based on filter
 */
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        border: Border(
          bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Theme.of(context).primaryColor),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
              ),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
