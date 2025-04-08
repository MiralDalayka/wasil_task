import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/features/home/presentation/blocs/products_cubit.dart';

import '../core/common/services/dialog/dialog_manager.dart';
import '../core/constants/constants.dart';
import '../core/theme/theme.dart';
import '../core/theme/theme_cubit/theme_cubit.dart';
import '../core/theme/theme_cubit/theme_states.dart';
import 'get_it/get_it.dart';
import 'layout/layout.dart';

class Wasil extends StatefulWidget {
  const Wasil({super.key});

  @override
  State<Wasil> createState() => _WasilState();
}

class _WasilState extends State<Wasil> {
  @override
  void initState() {
    // serviceLocator<PositionCubit>().getPositions().then((va) {
    //   serviceLocator<SymbolsCubit>().getSymbols().then((val) {
    //     serviceLocator<SymbolsCubit>().startConnection();
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<ThemeCubit>()..setThemeMode(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<ProductsCubit>()..getProducts(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navKey,
            title: Constants.appName,
            debugShowCheckedModeBanner: false,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            themeMode: serviceLocator<ThemeCubit>().themeMode,
            builder:
                (context, child) => Navigator(
                  onGenerateRoute:
                      (settings) => MaterialPageRoute(
                        builder: (context) => DialogManager(child: child!),
                      ),
                ),
            home: const Layout(),
          );
        },
      ),
    );
  }
}
