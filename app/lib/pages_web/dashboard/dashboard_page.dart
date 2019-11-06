import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_web/widgets/add_receipt_dialog.dart';

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
        backgroundColor: Palette.lightBlue,
        label: Text('Emetti scontrino'),
        icon: Icon(Icons.add),
      ),
      body: Center(
        child: Text('WEB'),
      ),
    );
  }
}
