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

  factory FiscalReceipt.fromMap(Map data) {
    if (data != null) {
      return FiscalReceipt(
        articles: List.from(data['items'])
            .map<TransactionArticle>(
              (a) => TransactionArticle(a['name'], a['price']),
            )
            .toList(),
        shopName: data['shop']['name'],
        time: DateTime.parse(data['created']),
        shopImageURL:
            data['shop']['image'] != null && data['shop']['image'].length > 0
                ? 'https://demo3.fastersetup.it${data['shop']['image']}'
                : null,
      );
    } else
      return null;
  }
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
