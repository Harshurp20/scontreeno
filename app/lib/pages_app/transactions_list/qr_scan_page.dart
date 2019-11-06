import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/qrcode_reader_view.dart';

class QrScanPage extends StatefulWidget {
  @override
  _QrScanPageState createState() => new _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      body: QrcodeReaderView(
        key: qrViewKey,
        onScan: (String token) {
          Navigator.pop(context, token);
          return null;
        },
        helpWidget: Text('Posiziona il codice QR all\'interno del quadrato'),
      ),
    );
  }

  GlobalKey<QrcodeReaderViewState> qrViewKey = GlobalKey();
}
