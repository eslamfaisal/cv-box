import 'package:cv_box/core/usecase.dart';
import 'package:cv_box/feature/auth/domain/repository/auth_repository.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  final AuthRepository _repository;
  IsLoggedInUseCase(this._repository);
  @override
  Future<bool> call({params}) async {
    return await _repository.isLoggedIn();
  }
}
