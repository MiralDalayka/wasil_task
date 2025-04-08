import 'package:flutter/material.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';

import '../../../../../../app/get_it/get_it.dart';
import '../../../../../../features/auth/presentation/screens/registration_screen.dart';
import '../../../../../../features/home/presentation/screens/test_home.dart';
import '../../../../../theme/theme_cubit/theme_cubit.dart';
import '../../../../services/dialog/dialog_service.dart';
import '../../../dialogs/select_theme_dialog.dart';
import 'drawert_tile_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerItem(
          icon: Icons.settings_outlined,
          title: 'Settings',
          // onTap: () => AppRouter.push(screen: SettingsScreen()),
        ),

        DrawerItem(icon: Icons.help_outline, title: 'User guide'),
        DrawerItem(
          icon: Icons.info_outline,
          title: 'About',
          onTap: () {
            AppRouter.push(screen: HomePage());
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: GestureDetector(
            onTap: () {
              final dialogService = serviceLocator<DialogService>();
              dialogService.showDialog(
                context: context,
                dismissable: true,
                dialog: SelectThemeDialog(),
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose theme",
                        style: TextTheme.of(context).labelLarge,
                      ),
                      Text(
                        "${serviceLocator<ThemeCubit>().themeMode?.name}",
                        style: TextTheme.of(context).labelMedium?.copyWith(
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
