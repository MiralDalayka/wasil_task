import 'package:flutter/material.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../core/common/services/dialog/dialog_service.dart';
import '../../core/common/services/shared_prefs/shared_prefs.dart';
import '../../core/common/widgets/dialogs/terms_and_conditions_dialog.dart';
import '../../core/common/widgets/misc/scaffold_wrapper.dart';
import '../../core/common/widgets/sections/drawer/drawer.dart';
import '../../features/home/presentation/screens/home_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final _dialogService = serviceLocator<DialogService>();
  @override
  void initState() {
    super.initState();
    if (!SharedPrefs.getBool("agreementDialogAccepted")) {
      Future.delayed(Duration(milliseconds: 100)).then((val) {
        _dialogService.showDialog(
          context: context,
          dismissable: false,
          dialog: TermsAndConditionsDialog(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: ScaffoldWrapper(
        child: PersistentTabView(
          drawer: TDrawer(),
          screenTransitionAnimation: ScreenTransitionAnimation.none(),
          handleAndroidBackButtonPress: false,
          stateManagement: true,
          tabs: [
            PersistentTabConfig(
              screen: ProductsScreen(),
              item: ItemConfig(
                title: "Home",
                inactiveIcon: Icon(Icons.home_outlined),
                icon: Icon(Icons.home),
              ),
            ),
          ],
          navBarBuilder:
              (config) => Style1BottomNavBar(
                navBarDecoration: NavBarDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                navBarConfig: config,
              ),
        ),
      ),
    );
  }
}
