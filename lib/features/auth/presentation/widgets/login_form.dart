import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../app/layout/layout.dart';
import '../../../../core/common/services/router/app_router.dart';
import '../../../../core/common/widgets/forms/form_field.dart';
import '../../../../core/common/widgets/misc/divider.dart';
import '../../../../core/utils/validator_utils.dart';

class LoginForm extends StatefulWidget {
  final ValueChanged<bool> onLoginButtonStateChanged;

  const LoginForm({super.key, required this.onLoginButtonStateChanged});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'or login with',
                style: TextTheme.of(context).labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              Gap(8),
              Image.network(
                'https://tse4.mm.bing.net/th/id/OIP.lsGmVmOX789951j9Km8RagHaHa?rs=1&pid=ImgDetMain',
                height: 24,
                width: 24,
              ),
            ],
          ),
          const Gap(14),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),

            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed:
                    emailController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty
                        ? () {
                          if (formKey.currentState!.validate()) {
                            AppRouter.push(screen: Layout());
                          }
                        }
                        : null,
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
