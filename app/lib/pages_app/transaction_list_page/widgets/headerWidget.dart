import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(24.0),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 6.0,
      shadowColor: Colors.black54,
      child: Container(
        width: double.infinity,
        height: 256.0,
        color: Palette.lightBlue,
      ),
    );
  }
}
