import 'package:flutter/material.dart';

class FormSection extends StatelessWidget {
  final String title;
  const FormSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: TextTheme.of(context).labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
          ),
        ],
      ),
    );
  }
}
