import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Palette.lightBlue,
        label: Text(
          'Crea scontrino',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(Icons.add),
        onPressed: () {},
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
                    'SconTreeNo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.bubble_chart,
                        color: Palette.lightBlue,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.list,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.mail,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.message,
                        color: Colors.black38,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
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
                          padding: const EdgeInsets.all(16.0),
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 48.0,
                                          child: Text('Grafico poco fico'),
                                        ),
                                        SizedBox(
                                          width: 32.0,
                                        ),
                                        CircularProgressIndicator(
                                          value: 0.75,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.blue),
                                        ),
                                      ],
                                    ),
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
                                    Column(
                                      children: List.generate(
                                        20,
                                        (index) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              Random.secure()
                                                  .nextInt(5555)
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ' +
                                                '${DateTime.now().hour}:${DateTime.now().minute}'),
                                            Text(
                                              '13 articoli',
                                              style:
                                                  TextStyle(color: Colors.grey),
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
                                          fontSize: 18.0),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 48.0,
                                          child: Text('Grafico poco fico'),
                                        ),
                                        SizedBox(
                                          width: 32.0,
                                        ),
                                        CircularProgressIndicator(
                                          value: 0.25,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.blue),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 38.0,
                                    ),
                                    Column(
                                      children: List.generate(
                                        20,
                                        (index) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              Random.secure()
                                                  .nextInt(5555)
                                                  .toStringAsFixed(0),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ' +
                                                '${DateTime.now().hour}:${DateTime.now().minute}'),
                                            Text(
                                              '13 articoli',
                                              style:
                                                  TextStyle(color: Colors.grey),
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
