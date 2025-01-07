import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/dashboard/model/dashboard_data.dart';

abstract interface class DashboardRepository {
  Future<Result<DashboardData, MamoException>> getDashboardData();
}