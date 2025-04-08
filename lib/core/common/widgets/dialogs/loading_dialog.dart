import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../misc/loading_indicator.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(8),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
      content: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 2),
        child: Row(
          children: [
            LoadingIndicator(),
            Gap(16),
            Text(
              "Please wait",
              style: TextTheme.of(
                context,
              ).labelLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
