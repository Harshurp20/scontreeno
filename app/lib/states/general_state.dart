import 'package:flutter/foundation.dart';

class GeneralState with ChangeNotifier {
  bool _isNFCactive = true;

  void changeNFCState() {
    _isNFCactive = !_isNFCactive;
    notifyListeners();
  }

  bool get nfcStatus => _isNFCactive;
}
