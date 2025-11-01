import 'package:cv_box/feature/auth/data/models/user_signin_req.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_firebase_service.dart';
import '../models/user.dart';
import '../models/user_creation_req.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthFirebaseService _authFirebaseService;

  AuthRepositoryImpl(this._authFirebaseService);

  @override
  Future<Either> signup(UserCreationReq user) async {
    return await _authFirebaseService.signup(user);
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    return await _authFirebaseService.signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await _authFirebaseService.sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await _authFirebaseService.isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await _authFirebaseService.getUser();
    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(UserModel.fromMap(data).toEntity());
      },
    );
  }

  @override
  Future<Either> signOut() async {
    return await _authFirebaseService.signOut();
  }
}
