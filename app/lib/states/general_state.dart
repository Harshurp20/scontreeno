import 'dart:async';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scontreeno/managers/receipts_manager.dart';
import 'package:scontreeno/models/receipt.dart';
import 'package:scontreeno/models/transaction_article.dart';

class GeneralState with ChangeNotifier {
  bool _isNFCactive = true;
  bool _isLoading = true;

  List<FiscalReceipt> _fiscalReceipts = [];
  List<TempReceipt> _tempReceipts = [
    TempReceipt(
      data: '146',
      description: 'Fila macellaio',
      shopName: 'Esselunga',
      time: DateTime.now(),
    ),
  ];
  bool get loading => _isLoading;

  GeneralState() {
    if (!kIsWeb) loadReceipts();
  }

  Future loadReceipts() async {
    _fiscalReceipts.clear();

    final receipts = (await ReceiptsManager.getReceipts()) ?? [];
    _fiscalReceipts.addAll(
      receipts..sort((a, b) => b.time.compareTo(a.time)),
    );

    notifyListeners();
  }

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
