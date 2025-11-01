import 'package:cv_box/feature/auth/data/data_source/auth_firebase_service.dart';
import 'package:cv_box/feature/auth/data/repository/auth_repository_imp.dart';
import 'package:cv_box/feature/auth/domain/repository/auth_repository.dart';
import 'package:cv_box/feature/auth/domain/usecases/get_user.dart';
import 'package:cv_box/feature/auth/domain/usecases/is_logged_in.dart';
import 'package:cv_box/feature/auth/domain/usecases/send_password_reset_email.dart';
import 'package:cv_box/feature/auth/domain/usecases/siginup.dart';
import 'package:cv_box/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:cv_box/feature/auth/domain/usecases/signin.dart';
import 'package:cv_box/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Services
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(sl<AuthFirebaseService>()),
  );

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase(sl<AuthRepository>()));

  sl.registerSingleton<SigninUseCase>(SigninUseCase(sl<AuthRepository>()));

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase(sl<AuthRepository>()),
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase(sl<AuthRepository>()),
  );

  sl.registerSingleton<GetUserUseCase>(GetUserUseCase(sl<AuthRepository>()));

  sl.registerSingleton<SignOutUseCase>(SignOutUseCase(sl<AuthRepository>()));

  sl.registerFactory<AuthCubit>(
    () => AuthCubit(
      signinUseCase: sl<SigninUseCase>(),
      signupUseCase: sl<SignupUseCase>(),
      sendPasswordResetEmailUseCase: sl<SendPasswordResetEmailUseCase>(),
      signOutUseCase: sl<SignOutUseCase>(),
    ),
  );
}
