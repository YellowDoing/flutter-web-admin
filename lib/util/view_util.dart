import 'dart:ui';

import 'package:flutter/material.dart';

Widget button(String text, VoidCallback tap) {
  return MaterialButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: tap,
      child: Text(text));
}

Widget input() {
  return Container(
    decoration: BoxDecoration(),
    child: TextField(
      onChanged: (value) {},
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    ),
  );
}

///吐司
void toast(BuildContext ctx, String msg,
    {Duration duration = const Duration(milliseconds: 1500)}) {
  BuildContext dialogContext;
  showGeneralDialog(
    barrierDismissible: false,
    barrierLabel: 'toast',
    context: ctx,
    barrierColor: Colors.transparent,
    pageBuilder: (context, animation, secondaryAnimation) {
      dialogContext = context;
      return Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.black54),
            child: Text(
              msg,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    },
  ).then((value) => dialogContext = null);
  Future.delayed(duration).then((value) {
    if (dialogContext != null && Navigator.canPop(dialogContext)) {
      Navigator.pop(dialogContext);
    }
  });
}
