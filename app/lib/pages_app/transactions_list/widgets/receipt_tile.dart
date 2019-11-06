import 'package:flutter/material.dart';
import 'package:scontreeno/misc/palette.dart';
import 'package:scontreeno/models/receipt.dart';
import 'package:scontreeno/pages_app/single_transaction_page/single_transaction_page.dart';

class FiscalReceiptTile extends StatelessWidget {
  final /* Fiscal */ Receipt receipt;
  const FiscalReceiptTile({Key key, this.receipt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: receipt is FiscalReceipt ? Colors.white : Palette.lightBlue,
        elevation: 6.0,
        shadowColor: Colors.black38,
        borderRadius: BorderRadius.circular(10.0),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: receipt is FiscalReceipt
              ? () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SingleTransactionPage(receipt: receipt)))
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox.fromSize(
                      size: Size.fromRadius(20.0),
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
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            receipt.shopName,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: receipt is FiscalReceipt
                                  ? Colors.black
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (receipt is FiscalReceipt)
                            Text(
                              receipt.time.toIso8601String(),
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.black38,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          else
                            Text(
                              'Ticket temporaneo',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (receipt is FiscalReceipt)
                      Text(
                        (receipt as FiscalReceipt).total.toStringAsFixed(2) +
                            '€',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Palette.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                  ],
                ),
                if (receipt is FiscalReceipt)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: (receipt as FiscalReceipt)
                          .articles
                          .map<Widget>(
                            (a) => Row(
                              children: <Widget>[
                                Text(
                                  a.title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '....................................................',
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  (a.tot
                                          .toStringAsFixed(2)
                                          .replaceAll('.', ',')) +
                                      '€',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          (receipt as TempReceipt).data,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 42.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (receipt as TempReceipt).description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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
    );
  }
}
