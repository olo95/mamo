import 'package:mamo/domain/user/model/user.dart';

class UserDto {
  final String id;
  final String name;
  final double balance;

  UserDto({required this.id, required this.name, required this.balance});

  factory UserDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      UserDto(
        id: json['id'] as String,
        name: json['name'] as String,
        balance: double.parse(json['balance'] as String),
      );

  User toDomain() => User(
        id: id,
        name: name,
        balance: balance,
      );
}
