import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/models/receipt.dart';
import 'package:scontreeno/pages_app/single_transaction_page/receiptPainter.dart';
import 'package:scontreeno/states/general_state.dart';

const double RECTANGLE_WIDTH = 330.0;

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
  final FiscalReceipt receipt;
  const SingleTransactionPage({Key key, this.receipt}) : super(key: key);

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
                      width: RECTANGLE_WIDTH,
                      height: 8.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            width: RECTANGLE_WIDTH - 32.0,
            height: 350.0,
            top: 248.0,
            child: CustomPaint(
              painter: RecepitPainter(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[],
                ),
              ),
            ),
          ),
          Container(
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
                      SizedBox.fromSize(
                        size: Size.fromRadius(48.0),
                        child: Material(
                          elevation: 6.0,
                          shadowColor: Colors.black38,
                          shape: CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: receipt.shopImageURL != null
                              ? Image.asset(
                                  receipt.shopImageURL,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox.expand(
                                  child: Container(
                                    color: receipt is FiscalReceipt
                                        ? Palette.lightBlue
                                        : Colors.white,
                                    child: Center(
                                      child: Text(
                                        receipt.shopName.substring(0, 1),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: receipt is FiscalReceipt
                                              ? Colors.white
                                              : Palette.lightBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        receipt.shopName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${receipt.time.day} ' +
                            Mesi.values
                                .toList()[receipt.time.month]
                                .toString()
                                .split('.')[1] +
                            ' ${receipt.time.year}',
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
                        width: RECTANGLE_WIDTH,
                        height: 8.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
