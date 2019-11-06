import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_app/transactions_list/transactions_list_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Material(
                elevation: 6.0,
                shadowColor: Colors.black38,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Email',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Material(
                elevation: 6.0,
                shadowColor: Colors.black38,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Password',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 64.0,
              ),
              RaisedButton(
                color: Palette.lightBlue,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Login'),
                  ],
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => TransactionsListPage(),
                  ),
                ),
              ),
              Text('oppure'),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.lock_outline),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Entra con SPID'),
                  ],
                ),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (context) => TransactionsListPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
