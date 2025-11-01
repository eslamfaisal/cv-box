import 'package:cv_box/feature/auth/domain/usecases/is_logged_in.dart';
import 'package:cv_box/feature/splash/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  final IsLoggedInUseCase _useCase;

  SplashCubit({required IsLoggedInUseCase useCase})
    : _useCase = useCase,
      super(DisplaySplash());

  void appStarted() async {
    var isLoggedIn = await _useCase.call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
