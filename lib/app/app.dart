import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:wasil_flutter_task/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:wasil_flutter_task/features/splash_screen.dart';

import '../core/common/services/dialog/dialog_manager.dart';
import '../core/constants/constants.dart';
import '../core/theme/theme.dart';
import '../core/theme/theme_cubit/theme_cubit.dart';
import '../core/theme/theme_cubit/theme_states.dart';
import '../features/product/presentation/blocs/products_cubit.dart';
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
    // serviceLocator<Cubit1>().get1().then((va) {
    //   serviceLocator<Cubit2>().get2().then((val) {
    //     serviceLocator<Cubit2>().startConnection();
    //   });
    // });
    serviceLocator<ProductsCubit>().getProducts();
    serviceLocator<CartCubit>().loadUserCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AuthCubit>()),

        BlocProvider(
          create: (context) => serviceLocator<ThemeCubit>()..setThemeMode(),
        ),
        BlocProvider(create: (context) => serviceLocator<ProductsCubit>()),

        BlocProvider(create: (context) => serviceLocator<CartCubit>()),
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
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
