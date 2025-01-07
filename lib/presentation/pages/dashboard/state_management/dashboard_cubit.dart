import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/dashboard/model/dashboard_data.dart';
import 'package:mamo/domain/dashboard/repository/dashboard_repository.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/dashboard/state_management/dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository;

  DashboardCubit(this._dashboardRepository)
      : super(
          DashboardLoadingState(
            currentUser: null,
            frequentUsers: [],
            allUsers: [],
          ),
        );

  Future<void> init() async {
    _emitLoadingState();

    final Result<DashboardData, MamoException> result = await _dashboardRepository.getDashboardData();

    switch (result) {
      case Success(value: DashboardData dashboardData):
        _emitLoadedState(
          dashboardData.currentUser,
          dashboardData.frequentUsers,
          dashboardData.allUsers,
        );
        break;
      case Failure(error: MamoException exception):
        debugPrint(exception.toString());

        _emitErrorState();
    }
  }

  void _emitLoadingState() {
    emit(
      DashboardLoadingState(
        currentUser: state.currentUser,
        frequentUsers: state.frequentUsers,
        allUsers: state.allUsers,
      ),
    );
  }

  void _emitLoadedState(
    User? currentUser,
    List<User> frequentUsers,
    List<User> allUsers,
  ) {
    emit(
      DashboardLoadedState(
        currentUser: currentUser,
        frequentUsers: frequentUsers,
        allUsers: allUsers,
      ),
    );
  }

  void _emitErrorState() {
    emit(
      DashboardErrorState(
        currentUser: state.currentUser,
        frequentUsers: state.frequentUsers,
        allUsers: state.allUsers,
      ),
    );
  }
}