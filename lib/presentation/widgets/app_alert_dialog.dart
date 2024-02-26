import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlertDialog {
  static Future<bool?> showAlert({
    required BuildContext context,
    required String title,
    required String content,
    String yesText = "Ha",
    String noText = "Yo'q",
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Return 'false' on No
              },
              child: Text(noText),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Return 'true' on Yes
              },
              child: Text(yesText),
            ),
          ],
        );
      },
    );
  }
}