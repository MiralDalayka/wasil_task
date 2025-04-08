import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../services/router/app_router.dart';

class NoAccountBody extends StatelessWidget {
  const NoAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Icon(
                Icons.add_circle_outline_sharp,
                size: 50,
                color: Theme.of(context).colorScheme.primary,
              ),
              Gap(12),
              Text(
                "No trading accounts to show",
                style: TextTheme.of(context).bodyMedium,
              ),
              Gap(12),
              FilledButton.tonal(
                onPressed: () {}, //TODO push into screen
                child: Text("Add Trading Account"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
