import 'package:flutter/material.dart';
import 'package:mamo/presentation/style/dimens.dart';

extension MamoSnackBar on ScaffoldMessengerState {
  void showMamoSnackBar(String title) {
    showSnackBar(SnackBar(padding: EdgeInsets.all(Dimens.m), content: Text(title)));
  }
}
