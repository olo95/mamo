import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamo/data/firestore/data_source/firestore_data_source.dart';
import 'package:mamo/data/user/model/user_dto.dart';
import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/domain/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirestoreDataSource firestoreDataSource;

  UserRepositoryImpl({required this.firestoreDataSource});

  @override
  Future<Result<User, MamoException>> getLoggedInUser() async {
    try {
      final Map<String, dynamic> currentUserJson = await firestoreDataSource.getLoggedInUser();
      final UserDto currentUser = UserDto.fromJson(currentUserJson);

      return Success(
        currentUser.toDomain(),
      );
    } catch (e) {
      return Failure(MamoGenericException(message: e.toString()));
    }
  }

  @override
  Future<Result<List<User>, MamoException>> getUsers() async {
    try {
      final List<Map<String, dynamic>> usersJson = await firestoreDataSource.getUsers();
      final List<UserDto> userDtoList = usersJson.map(UserDto.fromJson).toList();
      final List<User> userList = userDtoList
          .map(
            (userDto) => userDto.toDomain(),
          )
          .toList();

      return Success(userList);
    } catch (e) {
      return Failure(MamoGenericException(message: e.toString()));
    }
  }
}
