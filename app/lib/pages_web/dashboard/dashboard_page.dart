import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_web/widgets/add_receipt_dialog.dart';
import 'package:scontreeno/pages_web/dashboard/chart.dart';
import 'package:scontreeno/pages_web/dashboard/receipt_list.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddReceiptDialog(),
          );
        },
        foregroundColor: Colors.white,
        backgroundColor: Palette.lightBlue,
        label: Text(
          'Crea scontrino',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 64.0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SconTreeNo > ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    'Dashboard > ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    'Nome Negozio',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 64.0,
                width: 64.0,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.bubble_chart,
                        color: Palette.lightBlue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.list,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.mail,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.message,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.settings,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  elevation: 6.0,
                  shadowColor: Color(0xFF999999),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 64.0 - 40.0,
                    width: MediaQuery.of(context).size.width - 64.0 - 40.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Oggi',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Chart(),
                                    SizedBox(
                                      height: 16.0,
                                    ),
                                    Text(
                                      'Lista scontrini',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              144.0 -
                                              195.0,
                                      child: ReceiptList(),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Questo mese',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Chart(),
                                    SizedBox(
                                      height: 38.0,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              144.0 -
                                              195.0,
                                      child: ReceiptList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
