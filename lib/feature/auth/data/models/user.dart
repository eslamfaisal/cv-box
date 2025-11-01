
import '../../domain/entity/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.image,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      };
  }

  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      image: image,
    );
  }
}