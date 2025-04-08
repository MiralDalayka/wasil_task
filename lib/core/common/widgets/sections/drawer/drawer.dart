import 'package:flutter/material.dart';

import 'items/drawer_body_items.dart';
import 'items/drawer_header.dart';

class TDrawer extends StatefulWidget {
  const TDrawer({super.key});

  @override
  State<TDrawer> createState() => _TDrawerState();
}

class _TDrawerState extends State<TDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                // NoAccountHeader(),
                CustomeDrawerHeader(),
                DrawerBody(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
