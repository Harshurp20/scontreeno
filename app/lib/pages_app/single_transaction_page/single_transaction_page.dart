import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scontreeno/misc/palette.dart';
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
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(16.0),
            ),
            clipBehavior: Clip.antiAlias,
            color: Palette.lightBlue,
            child: Container(
              height: 256.0,
              width: double.infinity,
              padding: EdgeInsets.all(8.0),
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
                          backgroundImage: _notifier
                                  .receipts[index].shopImageURL
                                  .contains('res')
                              ? AssetImage(
                                  _notifier.receipts[index].shopImageURL)
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
                                  .toList()[
                                      _notifier.receipts[index].time.month]
                                  .toString()
                                  .split('.')[1] +
                              ' ${_notifier.receipts[index].time.year}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
