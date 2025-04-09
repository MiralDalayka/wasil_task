import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';
import '../app/layout/layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () async {
      AppRouter.pushReplace(screen: Layout());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Lottie.asset('assets/animations/splash_animation.json'),
            ),
            Text("WASIL", style: Theme.of(context).textTheme.titleLarge),
            Gap(16),
            Text(
              "A Place Where You Find Your Dreams",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
