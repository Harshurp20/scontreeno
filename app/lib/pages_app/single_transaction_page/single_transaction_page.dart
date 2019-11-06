import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/pages_app/single_transaction_page/receiptPainter.dart';
import 'package:scontreeno/states/general_state.dart';

GeneralState _notifier;
enum Mesi {
  Gennaio,
  Febbraio,
  Marzo,
  Aprile,
  Maggio,
  Giugno,
  Luglio,
  Agosto,
  Settembre,
  Ottobre,
  Novembre,
  Dicembre
}

class SingleTransactionPage extends StatelessWidget {
  final int index;
  SingleTransactionPage(this.index);
  @override
  Widget build(BuildContext context) {
    if (_notifier == null) _notifier = Provider.of<GeneralState>(context);
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.0),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 0.0,
            color: Palette.lightBlue,
            child: Container(
              padding: const EdgeInsets.only(top: 250.5, bottom: 16.0),
              color: Palette.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8.0)),
                    clipBehavior: Clip.antiAlias,
                    elevation: 0.0,
                    color: Color(0xFF10645B),
                    child: SizedBox(
                      width: 300.0,
                      height: 8.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            width: 256.0,
            height: 256.0,
            top: 248.0,
            child: CustomPaint(
              foregroundPainter: RecepitPainter(),
              
            ),
          ),
          /* Container(
            height: 251.0,
            width: double.infinity,
            color: Palette.lightBlue,
            padding: EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32.0,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: _notifier.receipts[index].shopImageURL
                                .contains('res')
                            ? AssetImage(_notifier.receipts[index].shopImageURL)
                            : NetworkImage(
                                _notifier.receipts[index].shopImageURL),
                        radius: 48.0,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        _notifier.receipts[index].shopName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${_notifier.receipts[index].time.day} ' +
                            Mesi.values
                                .toList()[_notifier.receipts[index].time.month]
                                .toString()
                                .split('.')[1] +
                            ' ${_notifier.receipts[index].time.year}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.0)),
                      clipBehavior: Clip.antiAlias,
                      elevation: 0.0,
                      color: Color(0xFF10645B),
                      child: SizedBox(
                        width: 300.0,
                        height: 8.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ), */
        ],
      ),
    );
  }
}
