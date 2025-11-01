import 'package:cv_box/core/usecase.dart';
import 'package:cv_box/feature/auth/data/models/user_signin_req.dart';
import 'package:cv_box/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  final AuthRepository _repository;
  SigninUseCase(this._repository);
  @override
  Future<Either> call({UserSigninReq? params}) async {

    return _repository.signin(params!);

  }
}
