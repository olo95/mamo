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
        balance: (json['balance'] as num).toDouble(),
      );

  User toDomain() => User(
        id: id,
        name: name,
        balance: balance,
      );
}
