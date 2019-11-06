import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/models/receipt.dart';
import 'package:scontreeno/pages_app/single_transaction_page/receiptPainter.dart';
import 'package:scontreeno/pages_app/transactions_list/widgets/animation_widget.dart';
import 'package:scontreeno/states/general_state.dart';

const double RECTANGLE_WIDTH = 330.0;

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

class SingleTransactionPage extends StatefulWidget {
  final FiscalReceipt receipt;
  const SingleTransactionPage({Key key, this.receipt}) : super(key: key);

  @override
  _SingleTransactionPageState createState() => _SingleTransactionPageState();
}

class _SingleTransactionPageState extends State<SingleTransactionPage> {
  bool receiptAnimation = false;
  double receiptHeigth = 0.0;
  @override
  Widget build(BuildContext context) {
    if (!receiptAnimation)
      Timer(const Duration(milliseconds: 3500), () {
        if (mounted) {
          receiptHeigth = widget.receipt.articles.length * 26.0 + 60.0;
          setState(() {
            receiptAnimation = true;
          });
        }
      });
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
          if (!receiptAnimation)
            Padding(
              child: AnimationWidget(),
              padding: EdgeInsets.only(top: 350.0),
            ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 900),
            width: RECTANGLE_WIDTH - 32.0,
            height: receiptHeigth,
            top: receiptAnimation ? 248.0 : 248.0 - receiptHeigth,
            curve: Curves.elasticInOut,
            child: CustomPaint(
              painter: RecepitPainter(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.receipt.articles.length + 1,
                  itemBuilder: (context, index) =>
                      index == widget.receipt.articles.length
                          ? Padding(
                              padding: EdgeInsets.only(top: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Totale: ${widget.receipt.articles.fold<double>(0.0, (prev, next) => prev + next.tot).toStringAsFixed(2)}€',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.receipt.articles[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  widget.receipt.articles[index].tot
                                          .toStringAsFixed(2) +
                                      '€',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                          child: widget.receipt.shopImageURL != null
                              ? Image.asset(
                                  widget.receipt.shopImageURL,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox.expand(
                                  child: Container(
                                    color: widget.receipt is FiscalReceipt
                                        ? Palette.lightBlue
                                        : Colors.white,
                                    child: Center(
                                      child: Text(
                                        widget.receipt.shopName.substring(0, 1),
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: widget.receipt is FiscalReceipt
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
                        widget.receipt.shopName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.receipt.time.day} ' +
                            Mesi.values
                                .toList()[widget.receipt.time.month]
                                .toString()
                                .split('.')[1] +
                            ' ${widget.receipt.time.year}',
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
