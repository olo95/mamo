import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/user/model/user.dart';

abstract interface class UserRepository {
  Future<Result<List<User>, MamoException>> getUsers();
  Future<Result<User, MamoException>> getLoggedInUser();
}
