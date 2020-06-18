import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffkey = GlobalKey<ScaffoldState>();
  void showSnackbar(SnackBar snackbar) {
    scaffkey.currentState.showSnackBar(snackbar);
  }
}
