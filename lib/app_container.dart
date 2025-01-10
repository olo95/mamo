import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamo/data/dashboard/repository/dashboard_repository_impl.dart';
import 'package:mamo/data/firestore/data_source/firestore_data_source.dart';
import 'package:mamo/data/transaction/repository/transaction_repository_impl.dart';
import 'package:mamo/data/user/repository/user_repository_impl.dart';
import 'package:mamo/domain/dashboard/repository/dashboard_repository.dart';
import 'package:mamo/domain/transaction/repository/transaction_repository.dart';
import 'package:mamo/domain/user/repository/user_repository.dart';
import 'package:mamo/presentation/pages/dashboard/state_management/dashboard_cubit.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_cubit.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_cubit.dart';

class AppContainer {
  // Data sources
  late final FirestoreDataSource firestoreDataSource = FirestoreDataSource(firestore: FirebaseFirestore.instance);

  // Repositories
  UserRepository get userRepository => UserRepositoryImpl(firestoreDataSource: firestoreDataSource);

  TransactionRepository get transactionRepository =>
      TransactionRepositoryImpl(userRepository: userRepository, firestoreDataSource: firestoreDataSource);

  DashboardRepository get dashboardRepository => DashboardRepositoryImpl(
        userRepository: userRepository,
        transactionRepository: transactionRepository,
      );

  // Cubits
  DashboardCubit get dashboardCubit => DashboardCubit(dashboardRepository);

  TransferCubit get transferCubit => TransferCubit();

  TransferConfirmCubit transferConfirmCubit({
    required String receiverId,
    required String receiverName,
    required double amountToSend,
  }) =>
      TransferConfirmCubit(
        receiverId: receiverId,
        receiverName: receiverName,
        amountToSend: amountToSend,
        transactionRepository: transactionRepository,
      );
}
