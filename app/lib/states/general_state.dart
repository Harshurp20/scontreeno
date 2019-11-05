import 'package:flutter/foundation.dart';
import 'package:scontreeno/models/receipt.dart';

class GeneralState with ChangeNotifier {
  bool _isNFCactive = true;
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
