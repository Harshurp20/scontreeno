import 'package:flutter/material.dart';
import 'package:scontreeno/models/transaction_article.dart';

abstract class Receipt {
  String shopName;
  String shopImageURL;
  DateTime time;

  Receipt(
    this.shopName,
    this.time, {
    this.shopImageURL,
  });
}

class FiscalReceipt extends Receipt {
  List<TransactionArticle> articles;

  FiscalReceipt({
    @required String shopName,
    @required this.articles,
    @required DateTime time,
    String shopImageURL,
  }) : super(shopName, time, shopImageURL: shopImageURL);

  double get total =>
      articles.fold<double>(0.0, (prev, article) => prev + article.tot);
}

class TempReceipt extends Receipt {
  String description;
  String data;

  TempReceipt({
    @required this.data,
    @required this.description,
    @required String shopName,
    @required DateTime time,
    String shopImageURL,
  }) : super(shopName, time, shopImageURL: shopImageURL);
}
