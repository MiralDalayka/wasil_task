import 'package:flutter/material.dart';

import '../../../../app/get_it/get_it.dart';
import '../../../constants/constants.dart';
import '../../../theme/theme_cubit/theme_cubit.dart';
import '../../services/dialog/dialog_service.dart';

class SelectThemeDialog extends StatefulWidget {
  const SelectThemeDialog({super.key});

  @override
  State<SelectThemeDialog> createState() => _SelectThemeDialogState();
}

class _SelectThemeDialogState extends State<SelectThemeDialog> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        final _dialogService = serviceLocator<DialogService>();
        final _themeCubit = serviceLocator<ThemeCubit>();
        return AlertDialog(
          insetPadding: EdgeInsets.all(8),
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
          titlePadding: EdgeInsets.only(
            left: 14,
            right: 14,
            top: 18,
            bottom: 8,
          ),
          buttonPadding: EdgeInsets.all(10),
          scrollable: true,
          title: Text("Choose theme"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  "System default",
                  style: TextTheme.of(context).labelLarge,
                ),
                value: ThemeEnums.system.name,
                groupValue: _themeCubit.themeMode?.name,
                onChanged: (value) {
                  setState(() {
                    _themeCubit.setFollowSystemMode();
                  });
                },
              ),
              RadioListTile(
                title: Text("Light", style: TextTheme.of(context).labelLarge),
                contentPadding: EdgeInsets.all(0),
                value: ThemeEnums.light.name,
                groupValue: _themeCubit.themeMode?.name,
                onChanged: (value) {
                  setState(() {
                    _themeCubit.setLightMode();
                  });
                },
              ),
              RadioListTile(
                title: Text("Dark", style: TextTheme.of(context).labelLarge),
                contentPadding: EdgeInsets.all(0),
                value: ThemeEnums.dark.name,
                groupValue: _themeCubit.themeMode?.name,
                onChanged: (value) {
                  setState(() {
                    _themeCubit.setDarkMode();
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _dialogService.hideDialog(context);
              },
              child: Text("Cancel".toUpperCase()),
            ),
          ],
        );
      },
    );
  }
}
