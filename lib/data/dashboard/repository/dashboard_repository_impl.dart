import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/dashboard/model/dashboard_data.dart';
import 'package:mamo/domain/dashboard/repository/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Result<DashboardData, MamoException>> getDashboardData() {
    // TODO: implement getDashboardData
    throw UnimplementedError();
  }

}