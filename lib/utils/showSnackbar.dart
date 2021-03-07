import 'package:flutter/material.dart';


final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

void showInSnackBar(
  String value,
) {
  scaffoldKey.currentState.showSnackBar(
    new SnackBar(
      content: new Text(value),
      duration: Duration(
        seconds: 5,
      ),
    ),
  );
}
