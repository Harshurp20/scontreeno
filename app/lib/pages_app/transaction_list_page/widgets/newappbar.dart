import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class NewAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.0,
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'SconTreeNo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'res/images/me.jpg',
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'res/images/tree.png',
                height: 128.0,
                width: 92.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fino ad ora gli utenti\nSconTreeNo hanno salvato',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 13.0),
                  ),
                  Text(
                    '3.549.378',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'alberi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      color: Palette.lightBlue,
    );
  }
}
