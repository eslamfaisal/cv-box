import 'package:cv_box/core/usecase.dart';
import 'package:cv_box/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  final AuthRepository _repository;
  SendPasswordResetEmailUseCase(this._repository);
  @override
  Future<Either> call({String? params}) async {
    return _repository.sendPasswordResetEmail(params!);
  }
}
