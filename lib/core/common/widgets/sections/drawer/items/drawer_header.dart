//TO USE LATER:

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';

import '../../../misc/divider.dart';

class CustomeDrawerHeader extends StatelessWidget {
  const CustomeDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8, start: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ), //TODO change it to user photo
              ),
              Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceLocator<AuthCubit>().isSignedIn
                        ? "Miral"
                        : "GUEST", //TODO CHANGE IT to username
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    width: 170,
                    child: Text(
                      '10003312454', //TODO CHANGE IT user account
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 12),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Manage Account',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        TDivider(),
      ],
    );
  }
}

//no account header

class NoAccountHeader extends StatelessWidget {
  const NoAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(top: 8, start: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ), //TODO change it to user photo
              ),
              Gap(15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Login to existing account or open',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 12),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // AppRouter.push(screen: LoginScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
