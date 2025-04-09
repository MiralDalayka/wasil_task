import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/features/auth/presentation/blocs/auth_cubit.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        serviceLocator<AuthCubit>().signUpWithGoogle();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'or sign up with',
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
    );
  }
}
