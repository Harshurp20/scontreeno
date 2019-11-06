import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scontreeno/pages_app/transactions_list/transactions_list_page.dart';
import 'package:scontreeno/pages_web/dashboard/dashboard_page.dart';
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
      home: kIsWeb ? DashboardPage() : TransactionsListPage(),
    );
  }
}
