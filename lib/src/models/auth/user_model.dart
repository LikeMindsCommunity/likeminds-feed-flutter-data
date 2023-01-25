import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? token;
  final String? refreshToken;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.token,
    this.refreshToken,
  });

  factory User.fromEntity({required UserEntity entity}) {
    return User(
        avatar: entity.avatar,
        email: entity.email,
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        refreshToken: entity.refreshToken,
        token: entity.token);
  }
}

@JsonSerializable()
class UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? token;
  final String? refreshToken;

  UserEntity({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.token,
    this.refreshToken,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
