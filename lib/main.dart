import 'package:cv_box/core/di.dart';
import 'package:cv_box/core/theme/app_theme.dart';
import 'package:cv_box/feature/auth/domain/usecases/is_logged_in.dart';
import 'package:cv_box/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:cv_box/feature/splash/cubit/splash_cubit.dart';
import 'package:cv_box/feature/splash/pages/splash.dart';
import 'package:cv_box/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SplashCubit(useCase: sl<IsLoggedInUseCase>())..appStarted(),
        ),
        BlocProvider(create: (context) => sl<AuthCubit>()),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
