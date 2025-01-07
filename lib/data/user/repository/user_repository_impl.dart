import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/domain/user/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Result<User, MamoException>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Result<List<User>, MamoException>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}