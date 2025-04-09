/*
HomeSearchBar: to find items based on filter
 */
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SearchBar(
            shadowColor: WidgetStatePropertyAll(Colors.transparent),
            side: WidgetStatePropertyAll(BorderSide(color: Colors.grey)),
            leading: Icon(Icons.search),
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            hintText: "Search",
            hintStyle: WidgetStatePropertyAll(TextStyle(fontSize: 15)),
          ),
        ),
        const Gap(10),
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: IconButton(
            icon: const Icon(Icons.filter_list), //todo change the icon
            onPressed: () {
              // Handle filter icon press
            },
          ),
        ),
      ],
    );
  }
}
