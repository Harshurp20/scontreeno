import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'res/images/me.jpg',
                height: 128.0,
                width: 128.0,
              ),
              Text('Da modificare con il logo dell app'),
              SizedBox(
                height: 64.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              OutlineButton(
                child: Text('Login'),
                onPressed: () {},
              ),
              Text('oppure'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.lock_outline),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Entra con SPID'),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
