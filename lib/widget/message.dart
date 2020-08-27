import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void showMessage(BuildContext context,String message) {
  showGeneralDialog(

      context: context,

      barrierDismissible: false,

      transitionDuration: Duration(milliseconds: 300),

      barrierLabel: 'GeneralDialog',

      pageBuilder: (dialogContext, __, ___) {

        Future.delayed(Duration(seconds: 3)).then((value) {
          if (Navigator.canPop(dialogContext)) {
            Navigator.pop(dialogContext);
          }
        });

        return Column(
          children: [
            SimpleDialog(
              elevation: 12,
              children: [Text(message)],
            )
          ],
        );

      });
}
