import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../../features/auth/presentation/screens/registration_screen.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme_cubit/theme_cubit.dart';
import '../../services/dialog/dialog_service.dart';
import '../../services/shared_prefs/shared_prefs.dart';
import '../../services/url_launcher/url_launcher_service.dart';
import '../misc/divider.dart';
import 'open_account_dialog.dart';

class TermsAndConditionsDialog extends StatefulWidget {
  const TermsAndConditionsDialog({super.key});

  @override
  State<TermsAndConditionsDialog> createState() =>
      _TermsAndConditionsDialogState();
}

class _TermsAndConditionsDialogState extends State<TermsAndConditionsDialog> {
  final _urlLauncher = serviceLocator<UrlLauncherService>();
  final themeCUbit = serviceLocator<ThemeCubit>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding:
          themeCUbit.isTablet
              ? EdgeInsets.symmetric(horizontal: 150)
              : EdgeInsets.symmetric(horizontal: 10),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
      titlePadding: EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 8),
      buttonPadding: EdgeInsets.all(10),
      scrollable: true,
      title: Column(
        children: [
          Text(
            "Welcome to ${Constants.appName}!",
            textAlign: TextAlign.center,
            style: TextTheme.of(context).titleMedium,
          ),
          Gap(6),
          TDivider(),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "In accordance with applicable laws and regulations, to operate, analyze or provide services through the application, we are required to request your consent for data collection, including access to personal information (Name, Email address, and phone number), app info and performance (crash logs), phone status and its identifiers (Device ID, Android ID) and other types of data listed in the ",
                  style: TextTheme.of(context).bodySmall,
                ),
                TextSpan(
                  text: "Privacy Policy",
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap =
                            () => _urlLauncher.openUrl(
                              url: Constants.privacyPolicyUrl,
                            ),
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Gap(18),
          Text(
            "We wil collect the necessary information only after you provide us with your consent, and such consent will not be used to access any information for purposes unrelated to this",
            style: TextTheme.of(context).bodySmall,
          ),
          Gap(18),
          Text(
            "We do not share your personal information with thid parties. We are comitted to strictly protecting the security of your personal information",
            style: TextTheme.of(context).bodySmall,
          ),
          Gap(18),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      "By pressing the ACCEPT button you acknowledge and agree with the terms and conditions of the ",
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "EULA ",
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap =
                            () => _urlLauncher.openUrl(
                              url: Constants.eulaPolicyUrl,
                            ),
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: "and the ",
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "Privacy Policy ",
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap =
                            () => _urlLauncher.openUrl(
                              url: Constants.privacyPolicyUrl,
                            ),
                  style: TextTheme.of(context).bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                TextSpan(
                  text: "including consent to data collections as described.",
                  style: TextTheme.of(
                    context,
                  ).bodySmall?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      SharedPrefs.setBool("agreementDialogAccepted", true);
                      final dialogService = serviceLocator<DialogService>();
                      dialogService.hideDialog(context);
                      AppRouter.push(screen: RegistrationScreen());
                    },
                    child: Text("Accept"),
                  ),
                ),
                Gap(10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      SharedPrefs.setBool("agreementDialogAccepted", false);
                      SystemNavigator.pop();
                    },
                    child: Text("Decline"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
