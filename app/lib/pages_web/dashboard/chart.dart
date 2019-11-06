import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 128.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(
              15,
              (index) => Padding(
                padding: EdgeInsets.all(2.0),
                child: Material(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(2.0),
                  ),
                  color: Palette.lightBlue,
                  child: SizedBox(
                    width: ((MediaQuery.of(context).size.width - 104) / 2) / 30,
                    height: Random.secure().nextDouble() * 90.0,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 32.0,
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
            height: 64.0,
            width: 64.0,
            child: FittedBox(
              fit: BoxFit.cover,
              child: CircularProgressIndicator(
                value: Random().nextDouble(),
                valueColor: AlwaysStoppedAnimation<Color>(Palette.lightBlue),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
