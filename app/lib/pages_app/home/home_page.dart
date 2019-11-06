import 'package:flutter/material.dart';
import 'package:scontreeno/managers/nfc_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _hasNfc;
  String _nfcData;

  @override
  void initState() {
    super.initState();
    _initNfc();
  }

  void _initNfc() async {
    _hasNfc = await NfcManager.hasNfc();
    print('Has NFC: $_hasNfc');
    setState(() {});

    if (_hasNfc ?? false) {
      NfcManager.listenNfc().listen((data) {
        print(data.content);
        setState(() {
          _nfcData = data.content;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Has NFC: $_hasNfc'),
          Text('NFC data: $_nfcData'),
        ],
      ),
    );
  }
}
