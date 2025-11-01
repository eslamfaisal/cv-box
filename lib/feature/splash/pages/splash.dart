import 'package:cv_box/core/constants/app_colors.dart';
import 'package:cv_box/core/navigator/app_navigator.dart';
import 'package:cv_box/feature/auth/presentation/pages/siginin_page.dart';
import 'package:cv_box/feature/home/home.dart';
import 'package:cv_box/feature/splash/cubit/splash_cubit.dart';
import 'package:cv_box/feature/splash/cubit/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SigninPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20,),
            Text("loading...")
          ],
        )),
      ),
    );
  }
}
