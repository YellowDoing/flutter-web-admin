import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


bool _isDropDownShow = false;

class DropDown extends StatefulWidget {


  static void showDropDown(
      {@required BuildContext context,
      @required GlobalKey targetKey,
      @required Widget child,
      VoidCallback onClose}) {

    RenderBox renderBox = targetKey.currentContext.findRenderObject();
    Offset offset = renderBox.localToGlobal(Offset.zero);
    Size size = targetKey.currentContext.size;

    showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: 'DropDown',
        transitionDuration: Duration(milliseconds: 300),
        context: context,
        pageBuilder: (dialogContext, _, __) {


          return Stack(
            children: [
              Positioned(
                child: Material(
                  borderRadius: BorderRadius.circular(2),
                  elevation: 3,
                  child: Container(
                    child: child,
                  ),
                ),
                top: offset.dy + size.height,
                left: offset.dx
              )
            ],
          );
        }).then((value) {
      onClose?.call();
    });
  }

  final GlobalKey targetKey;

  DropDown({this.targetKey});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

