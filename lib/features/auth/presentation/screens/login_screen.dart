import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/core/common/widgets/misc/divider.dart'
    show TDivider;
import 'package:wasil_flutter_task/features/auth/presentation/screens/registration_screen.dart';

import '../../../../core/common/services/router/app_router.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginButtonEnabled = false;

  void _onLoginButtonStateChanged(bool state) {
    setState(() {
      isLoginButtonEnabled = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 26,
        title: Text(
          "Wasil Ltd.",
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: [
          Text(
            "Login to an existing account",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Gap(7),
          const TDivider(),
          const Gap(7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: LoginForm(
              onLoginButtonStateChanged: _onLoginButtonStateChanged,
            ),
          ),
        ],
      ),
    );
  }
}
