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
                Random().nextInt(55555).toStringAsFixed(0),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ' +
                      '${DateTime.now().hour}:${DateTime.now().minute}'),
              Text(
                '${Random().nextInt(15) + 2} articoli',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '${Random().nextInt(400) + 20},${Random().nextInt(99) + 2}€',
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
