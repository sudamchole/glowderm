import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

Widget showIndicator(Exception e) {
  if (e == null) {
    return CircularProgressIndicator();
  }
  return Text("Sorry there is problem occured.");
}

void showAlert(BuildContext context, String errorMessage, ScaffoldState state) {
  //final snackBar = SnackBar(content: Text(errorMessage));
 // state.showSnackBar(snackBar);
  Toast.show(errorMessage, context);
}
