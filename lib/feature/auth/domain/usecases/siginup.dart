import 'package:cv_box/core/usecase.dart';
import 'package:cv_box/feature/auth/data/models/user_creation_req.dart';
import 'package:cv_box/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  final AuthRepository _repository;
  SignupUseCase(this._repository);
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await _repository.signup(params!);
  }
}
