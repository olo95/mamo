class UserDto {
  final String name;
  final double balance;

  UserDto({required this.name, required this.balance});

  factory UserDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      UserDto(
        name: json['name'] as String,
        balance: (json['balance'] as num).toDouble(),
      );
}
