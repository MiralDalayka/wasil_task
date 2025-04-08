import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../theme/theme_cubit/theme_cubit.dart';
import '../../services/dialog/dialog_service.dart';
import '../../services/url_launcher/url_launcher_service.dart';
import '../misc/divider.dart';

class CreateAccountDialog extends StatefulWidget {
  const CreateAccountDialog({super.key});

  @override
  State<CreateAccountDialog> createState() => _CreateAccountDialogState();
}

class _CreateAccountDialogState extends State<CreateAccountDialog> {
  final _urlLauncher = serviceLocator<UrlLauncherService>();
  final themeCUbit = serviceLocator<ThemeCubit>();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return AlertDialog(
          insetPadding:
              themeCUbit.isTablet
                  ? orientation == Orientation.portrait
                      ? EdgeInsets.symmetric(horizontal: 160)
                      : EdgeInsets.symmetric(horizontal: 350)
                  : EdgeInsets.symmetric(horizontal: 10),
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          titlePadding: EdgeInsets.only(
            left: 14,
            right: 14,
            top: 18,
            bottom: 8,
          ),
          buttonPadding: EdgeInsets.all(10),
          scrollable: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Text(
                    "Create an account",
                    style: TextTheme.of(context).titleMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      final dialogService = serviceLocator<DialogService>();
                      dialogService.hideDialog(context);
                    },
                    child: Icon(
                      Icons.clear,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              Gap(6),
              TDivider(),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Wasil Ltd.", style: TextTheme.of(context).bodySmall),
              Text(
                "www.wasil.net",
                style: TextTheme.of(context).bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(18),
              Text(
                "By opening an account, you agree to the account opening terms and to the data protection policy of Wasil Ltd.",
                style: TextTheme.of(context).bodySmall,
              ),
              Gap(10),
            ],
          ),
          actions: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          final dialogService = serviceLocator<DialogService>();
                          dialogService.hideDialog(context);
                          // AppRouter.push(screen: RegistrationScreen()); //TODO change it
                        },
                        child: Text("Create an Account"),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          final dialogService = serviceLocator<DialogService>();
                          dialogService.hideDialog(context);
                          // AppRouter.push(screen: RegistrationScreen()); //TODO change it
                        },
                        child: Text("Continue as a Guest"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
