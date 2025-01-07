import 'package:flutter/widgets.dart';
import 'package:mamo/app_container.dart';

class AppContainerProvider extends InheritedWidget {
  final AppContainer instance;

  const AppContainerProvider({
    super.key,
    required this.instance,
    required super.child,
  });

  static AppContainer of(BuildContext context) {
    final AppContainerProvider? result = context.dependOnInheritedWidgetOfExactType<AppContainerProvider>();
    assert(result != null, 'No AppContainerProvider found in context');
    return result!.instance;
  }

  @override
  bool updateShouldNotify(AppContainerProvider oldWidget) => false;
}
