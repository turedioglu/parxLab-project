import 'package:flutter/material.dart';
import 'package:parxlab_project/helper/color_helper.dart';


final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

void showInSnackBar(
  String value,
) {
  scaffoldKey.currentState.showSnackBar(
    new SnackBar(
      backgroundColor: snackBarRengi,
      content: new Text(value),
      duration: Duration(
        seconds: 5,
      ),
    ),
  );
}
