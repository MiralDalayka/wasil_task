import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/misc/divider.dart';

class AccountInfoTile extends StatelessWidget {
  final String title;
  final String value;
  const AccountInfoTile({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            Text(value, style: TextTheme.of(context).bodyMedium),
          ],
        ),
        Gap(8),
        TDivider(),
      ],
    );
  }
}
