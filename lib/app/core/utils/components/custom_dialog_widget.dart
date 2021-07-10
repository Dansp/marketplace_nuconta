import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

enum TypeDialog{
  INFO, WARNING, ERROR, OK
}

class CustomDialog extends StatefulWidget {
  final String title;
  final TypeDialog type;
  final String msg;
  final bool isNavigation;
  final bool isRemoveUntil;
  final String untilRoute;
  final String route;
  final bool btn1;
  final bool btn2;
  final String btn1Text;
  final String btn2Text;
  final Widget? body;

  CustomDialog(
      {this.title = '',
        this.isRemoveUntil = false,
        required this.type,
        required this.msg,
        required this.isNavigation,
        this.route = '',
        required this.btn1,
        this.btn2 = false,
        required this.btn1Text,
        this.btn2Text = '',
        this.untilRoute = '',
        this.body});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  List<Color> colors = [
    Colors.blue,
    Colors.orangeAccent,
    Colors.red,
    Colors.green
  ];

  List<IconData> icons = [
    Icons.info,
    Icons.warning,
    Icons.error,
    Icons.check
  ];

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              widget.title != '' ? Text(
                widget.title,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[600]
                ),
              ) : Container(),
              SizedBox(height: 16.0),
              Text(
                widget.msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600]
                ),
              ),
              widget.body ?? Container(),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  this.widget.btn1
                      ? FlatButton(
                    color: this.colors[this.widget.type.index],
                    onPressed: () {
                      if (widget.isNavigation) {
                        if (widget.isRemoveUntil) {
                          Navigator.pushNamedAndRemoveUntil(this.context, widget.route, widget.untilRoute != '' ? ModalRoute.withName(widget.untilRoute) :  (Route<dynamic> route) => false);
                        } else {
                          Navigator.pushReplacementNamed(this.context, widget.route);
                        }
                      } else {
                        Navigator.pop(this.context, true);
                      }
                    },
                    child: Text(
                      widget.btn1Text,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ) : Container(),
                  this.widget.btn2
                      ? SizedBox(
                    width: 10,
                  )
                      : Container(),
                  this.widget.btn2
                      ? FlatButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                      widget.btn2Text,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                      : Container(),
                ],
              )
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            child:
            // Image.asset(this.image,
            // color: Colors.white,
            // height: 50, width: 50),
            Icon(
              this.icons[widget.type.index],
              color: Colors.white,
              size: 50,
            ),
            backgroundColor: this.colors[this.widget.type.index],
            radius: Consts.avatarRadius,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
