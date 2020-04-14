library animated_dialog_box;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:jogo_da_memoria/main.dart';

class Animated_dialog_box {
  static Future showCustomAlertBox({
    @required BuildContext context,
    @required Widget yourWidget,
    @required Widget firstButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "Button is null!!");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                yourWidget,
              ],
            ),
            actions: <Widget>[firstButton],
            elevation: 10,
          );
        });
  }

  static Future showScaleAlertBox({
    @required BuildContext context,
    @required Widget yourWidget,
    Widget icon,
    Widget title,
    @required Widget firstButton,
    Widget secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: title,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    icon,
                    Container(
                      height: 10,
                    ),
                    yourWidget
                  ],
                ),
                actions: <Widget>[
                  firstButton,
                  secondButton,
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  static Future showInOutDailog({
    @required BuildContext context,
    @required Widget yourWidget,
    Widget icon,
    Widget title,
    @required Widget firstButton,
    Widget secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.7),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.fastOutSlowIn.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                title: title,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    icon,
                    Container(
                      height: 10,
                    ),
                    yourWidget
                  ],
                ),
                actions: <Widget>[firstButton, secondButton],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  static Future showRotatedAlert({
    @required BuildContext context,
    @required Widget yourWidget,
    Widget icon,
    Widget title,
    @required Widget firstButton,
    Widget secondButton,
  }) {
    assert(context != null, "context is null!!");
    assert(yourWidget != null, "yourWidget is null!!");
    assert(firstButton != null, "button is null!!");
    return showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1, anim2) {},
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.7),
        barrierLabel: '',
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.rotate(
            angle: math.radians(anim1.value * 360),
            child: AlertDialog(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
              title: title,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  icon,
                  Container(
                    height: 10,
                  ),
                  yourWidget
                ],
              ),
              actions: <Widget>[firstButton, secondButton],
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 300));
  }
}

Future<Widget> boxAnimation(BuildContext context, Function function) async {
  //* A função 'function' é execultada assim que é chamada no parametro.
  return await Animated_dialog_box.showRotatedAlert(
    title: Center(child: Text("FIM DE JOGO!!!")), // IF YOU WANT TO ADD
    context: context,
    firstButton: MaterialButton(
      // FIRST BUTTON IS REQUIRED
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: Colors.white,
      child: Text('Ok'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),

    icon: Icon(
      Icons.games,
      color: Colors.blue,
    ), // IF YOU WANT TO ADD ICON
    yourWidget: Container(
      child:
          Text('Sua pntuação foi: $pontos\nPrecione OK para reiniciar o jogo!'),
    ),
  );
}
