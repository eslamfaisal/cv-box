import 'package:cv_box/feature/auth/data/models/user_creation_req.dart';
import 'package:cv_box/feature/auth/data/models/user_signin_req.dart';
import 'package:cv_box/feature/auth/domain/usecases/send_password_reset_email.dart';
import 'package:cv_box/feature/auth/domain/usecases/siginup.dart';
import 'package:cv_box/feature/auth/domain/usecases/sign_out_usecase.dart';
import 'package:cv_box/feature/auth/domain/usecases/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SigninUseCase _signinUseCase;
  final SignupUseCase _signupUseCase;
  final SendPasswordResetEmailUseCase _sendPasswordResetEmailUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthCubit({
    required SigninUseCase signinUseCase,
    required SignupUseCase signupUseCase,
    required SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase,
    required SignOutUseCase signOutUseCase,
  }) : _signinUseCase = signinUseCase,
       _signupUseCase = signupUseCase,
       _sendPasswordResetEmailUseCase = sendPasswordResetEmailUseCase,
       _signOutUseCase = signOutUseCase,
       super(AuthInitial());

  Future<void> signIn(UserSigninReq params) async {
    emit(SigninLoading());

    final result = await _signinUseCase.call(params: params);

    result.fold(
      (failure) => emit(SigninFailure(message: failure.toString())),

      (user) => emit(SigninSuccess()),
    );
  }

  Future<void> signUp(UserCreationReq params) async {
    emit(SignupLoading());

    final result = await _signupUseCase.call(params: params);

    result.fold(
      (failure) => emit(SignupFailure(message: failure.toString())),
      (user) => emit(SignupSuccess()),
    );
  }

  Future<void> sendResetEmail(String email) async {
    emit(SendPasswordResetEmailLoading());
    final result = await _sendPasswordResetEmailUseCase.call(params: email);
    result.fold(
      (failure) =>
          emit(SendPasswordResetEmailFailure(message: failure.toString())),
      (_) => emit(SendPasswordResetEmailSuccess()),
    );
  }

  Future<void> signOut() async {
    emit(SignOutLoading());
    final result = await _signOutUseCase.call();
    result.fold(
      (failure) => emit(SignOutFailure(message: failure.toString())),
      (_) => emit(SignOutSuccess()),
    );
  }
}
