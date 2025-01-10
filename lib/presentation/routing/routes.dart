import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/dashboard/dashboard_page_builder.dart';
import 'package:mamo/presentation/pages/onboarding/onboarding_page.dart';
import 'package:mamo/presentation/pages/transfer/transfer_page_builder.dart';
import 'package:mamo/presentation/routing/route_paths.dart';

part 'routes.g.dart';

@TypedGoRoute<OnboardingRoute>(
  path: RoutePaths.onboarding,
  routes: [],
)
class OnboardingRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const OnboardingPage();
}

@TypedGoRoute<DashboardRoute>(
  path: RoutePaths.dashboard,
  routes: [TypedGoRoute<TransferRoute>(path: RoutePaths.transfer)],
)
class DashboardRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const DashboardPageBuilder();
}

class TransferRoute extends GoRouteData {
  final TransferRouteArguments? $extra;

  TransferRoute({required this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) => TransferPageBuilder(
        transferRouteArguments: $extra!,
      );
}

class TransferRouteArguments {
  final User receiver;
  final double currentBalance;

  TransferRouteArguments({
    required this.receiver,
    required this.currentBalance,
  });
}
