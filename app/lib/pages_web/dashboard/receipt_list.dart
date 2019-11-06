import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class ReceiptList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        20,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                Random.secure().nextInt(5555).toStringAsFixed(0),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ' +
                      '${DateTime.now().hour}:${DateTime.now().minute}'),
              Text(
                '13 articoli',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '137,21€',
                style: TextStyle(
                  color: Palette.lightBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
