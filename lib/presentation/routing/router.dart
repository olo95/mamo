import 'package:go_router/go_router.dart';
import 'package:mamo/presentation/routing/route_paths.dart';
import 'package:mamo/presentation/routing/routes.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: RoutePaths.onboarding,
);
