import 'package:flutter/material.dart';
import 'package:mamo/presentation/routing/router.dart';
import 'package:mamo/presentation/style/generated/colors.gen.dart';

class MamoApp extends StatelessWidget {
  const MamoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Mamo',
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: MamoColors.primary,
            secondary: MamoColors.tertiary,
            surface: MamoColors.surface,
            error: MamoColors.error,
            onPrimary: MamoColors.onPrimary,
            onSecondary: MamoColors.onSecondary,
            onSurface: MamoColors.onSurface,
            onError: MamoColors.onError,
          ),
          useMaterial3: true,
        ),
      );
}
