import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        horizontalTitleGap: 20,
        title: Text(title, style: TextTheme.of(context).bodySmall),
      ),
    );
  }
}
