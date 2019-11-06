import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scontreeno/models/receipt.dart';

class GeneralState with ChangeNotifier {
  bool _isNFCactive = true;

  bool _isLoading = true;

  List<Receipt> receipts = [
    Receipt(
      shopName: 'McDonald\'s',
      isFiscale: true,
      isTemporaneo: false,
      tot: 10.6,
      shopImageURL: 'res/images/mcdonalds.jpg',
      time: DateTime.now(),
    ),
  ];
  bool get loading => _isLoading;

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void addReceipt(Receipt receipt) {
    receipts.add(receipt);
    notifyListeners();
  }

  void changeNFCState() {
    _isNFCactive = !_isNFCactive;
    notifyListeners();
  }

  bool get nfcStatus => _isNFCactive;
}
