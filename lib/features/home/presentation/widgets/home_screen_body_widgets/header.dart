/*
This widget consist of :  User Location and Notification Icon Button
 */

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(Icons.location_on),
            Gap(8),
            //TODO: change it to get user location
            Text('New York, USA'),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            //todo:Navigate to all notifications view page
          },
        ),
      ],
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Location", style: Theme.of(context).textTheme.titleMedium);
  }
}
