import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scontreeno/models/receipt.dart';
import 'package:scontreeno/models/transaction_article.dart';

class GeneralState with ChangeNotifier {
  bool _isNFCactive = true;
  bool _isLoading = true;

  List<FiscalReceipt> _fiscalReceipts = [
    FiscalReceipt(
      shopName: 'McDonald\'s',
      time: DateTime.now(),
      shopImageURL: 'res/images/mcdonalds.jpg',
      articles: [
        TransactionArticle('a', 2.30),
        TransactionArticle('h fbdsbksdn afukl segk', 2.30),
        TransactionArticle('Big Tasty', 6.80, discounts: [
          Discount(title: 'Cupon digitale', discount: 0.70),
        ]),
        TransactionArticle('Big Mac', 4.50),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('Big Mac', 4.50),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('Big Mac', 4.50),
        TransactionArticle('McFlurry', 2.30),
        TransactionArticle('McFlurry', 2.30),
      ],
    ),
  ];
  List<TempReceipt> _tempReceipts = [
    TempReceipt(
      data: '146',
      description: 'Fila maccelaio',
      shopName: 'Esselunga',
      time: DateTime.now(),
    ),
  ];
  bool get loading => _isLoading;

  void changeLoadingState() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void addReceipt(Receipt receipt) {
    if (receipt is FiscalReceipt) {
      _fiscalReceipts.add(receipt);
    } else {
      _tempReceipts.add(receipt);
    }

    notifyListeners();
  }

  void changeNFCState() {
    _isNFCactive = !_isNFCactive;
    notifyListeners();
  }

  bool get nfcStatus => _isNFCactive;

  UnmodifiableListView<FiscalReceipt> get fiscalReceipts =>
      UnmodifiableListView(_fiscalReceipts);
  UnmodifiableListView<TempReceipt> get tempReceipts =>
      UnmodifiableListView(_tempReceipts);
}
