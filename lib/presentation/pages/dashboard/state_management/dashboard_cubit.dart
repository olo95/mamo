import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/dashboard/model/dashboard_data.dart';
import 'package:mamo/domain/dashboard/model/transaction_details.dart';
import 'package:mamo/domain/dashboard/repository/dashboard_repository.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/dashboard/state_management/dashboard_state.dart';

final class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _dashboardRepository;

  DashboardCubit(this._dashboardRepository)
      : super(
          DashboardLoadingState(
            currentUser: null,
            frequentUsers: [],
            allUsers: [],
            recentTransactions: []
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
          dashboardData.recentTransactions,
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
        recentTransactions: state.recentTransactions,
      ),
    );
  }

  void _emitLoadedState(
    User? currentUser,
    List<User> frequentUsers,
    List<User> allUsers,
      List<TransactionDetails> recentTransactions,
  ) {
    emit(
      DashboardLoadedState(
        currentUser: currentUser,
        frequentUsers: frequentUsers,
        allUsers: allUsers,
        recentTransactions: recentTransactions,
      ),
    );
  }

  void _emitErrorState() {
    emit(
      DashboardErrorState(
        currentUser: state.currentUser,
        frequentUsers: state.frequentUsers,
        allUsers: state.allUsers,
        recentTransactions: state.recentTransactions,
      ),
    );
  }
}
