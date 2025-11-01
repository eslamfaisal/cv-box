import 'package:cv_box/core/usecase.dart';
import 'package:cv_box/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase implements UseCase<Either, dynamic> {
  final AuthRepository _repository;
  SignOutUseCase(this._repository);
  @override
  Future<Either> call({dynamic params}) async {
    return await _repository.signOut();
  }
}
