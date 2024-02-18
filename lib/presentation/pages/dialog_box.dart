import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlertDialog {
  static Future<void> showAlert(BuildContext context, String title, String message, Function()? callback) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (callback != null) {
                  callback();
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
