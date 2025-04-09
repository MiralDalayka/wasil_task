import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/core/common/widgets/dialogs/loading_dialog.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';
import 'package:wasil_flutter_task/features/auth/presentation/widgets/signin_with_google.dart';

import '../../../../app/layout/layout.dart';
import '../../../../core/common/services/router/app_router.dart';
import '../../../../core/common/widgets/forms/form_field.dart';
import '../../../../core/common/widgets/misc/divider.dart';
import '../../../../core/utils/validator_utils.dart';
import '../../../../core/common/services/dialog/dialog_service.dart';

class LoginForm extends StatefulWidget {
  final ValueChanged<bool> onLoginButtonStateChanged;

  const LoginForm({super.key, required this.onLoginButtonStateChanged});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _dialogService = serviceLocator<DialogService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool? isPasswordSaved = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TFormField(
            controller: emailController,
            label: "Login",
            validator: (value) => ValidatorUtils.validateEmail(email: "$value"),
            onChanged: (value) {
              setState(() {});
            },
          ),
          const Gap(10),
          TFormField(
            isPass: true,

            controller: passwordController,
            label: "Password",
            validator:
                (value) => ValidatorUtils.validatePassword(pwd: "$value"),
            onChanged: (value) {
              setState(() {});
            },
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Save password",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Checkbox(
                tristate: false,
                value: isPasswordSaved,
                onChanged: (value) {
                  setState(() {
                    isPasswordSaved = value;
                  });
                },
              ),
            ],
          ),
          const TDivider(),
          const Gap(14),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Gap(5),
          SignInWithGoogle(),
          const Gap(14),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),

            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    if (formKey.currentState!.validate()) {
                      _dialogService.showDialog(
                        context: context,
                        dismissable: false,
                        dialog: LoadingDialog(),
                      );
                      await Future.delayed(Duration(seconds: 2));
                      _dialogService.hideDialog(context);
                      serviceLocator<AuthCubit>().logInWithEmail(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text("LOGIN"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
