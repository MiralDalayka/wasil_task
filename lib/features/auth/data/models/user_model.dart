import 'package:wasil_flutter_task/features/auth/domain/entities/auth_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.firstName,
    required super.secondName,
    required super.dateOfBirth,
    required super.phoneNumber,
    required super.email,
    required super.language,
    required super.coinType,
    required super.useGlobalAccount,
    required super.acceptedTerms,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      secondName: json['secondName'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      language: json['language'],
      coinType: json['coinType'],
      useGlobalAccount: json['useGlobalAccount'],
      acceptedTerms: json['acceptedTerms'],
    );
  }
}
