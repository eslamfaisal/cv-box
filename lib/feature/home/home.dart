import 'package:cv_box/core/navigator/app_navigator.dart';
import 'package:cv_box/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:cv_box/feature/auth/presentation/cubit/auth_state.dart';
import 'package:cv_box/feature/auth/presentation/pages/siginin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          AppNavigator.pushAndRemove(context, const SigninPage());
        } else if (state is SignOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) {
          return current is SignOutLoading || previous is SignOutLoading;
        },
        builder: (context, state) {
          if (state is SignOutLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to the Home Page!'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
