import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static double avarageRating(List<int> rating) {
    var avgrating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgrating = avgrating + rating[i];
    }
    return double.parse((avgrating / rating.length).toStringAsFixed(1));
  }

  static void fieldFocusChanged(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static ToastShow(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.black,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        fontSize: 16);
  }

  static FlushbarError(BuildContext context, String message) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.blue[300],
          ),
          margin: EdgeInsets.all(6.0),
          flushbarStyle: FlushbarStyle.FLOATING,
          flushbarPosition: FlushbarPosition.TOP,
          textDirection: Directionality.of(context),
          borderRadius: BorderRadius.circular(12),
          duration: Duration(seconds: 3),
          leftBarIndicatorColor: Colors.blue,
        )..show(context));
    // Flushbar(
    //   message: message,
    //   icon: Icon(
    //     Icons.info_outline,
    //     size: 28.0,
    //     color: Colors.blue[300],
    //   ),
    //   margin: EdgeInsets.all(6.0),
    //   flushbarStyle: FlushbarStyle.FLOATING,
    //   flushbarPosition: FlushbarPosition.TOP,
    //   textDirection: Directionality.of(context),
    //   borderRadius: BorderRadius.circular(12),
    //   duration: Duration(seconds: 3),
    //   leftBarIndicatorColor: Colors.blue,
    // )..show(context);
  }

  static snackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ));
  }
}
