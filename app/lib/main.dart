import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scontreeno/pages_app/single_transaction_page/single_transaction_page.dart';
import 'package:scontreeno/pages_app/transaction_list_page/transaction_list_page.dart';
import 'package:scontreeno/states/general_state.dart';

void main() => runApp(
      ChangeNotifierProvider(
        builder: (context) => GeneralState(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SconTreeNo',
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        primarySwatch: Colors.green,
      ),
      home: SafeArea(child: SingleTransactionPage(0)),
    );
  }
}
