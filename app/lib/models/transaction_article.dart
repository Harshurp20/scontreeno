import 'package:flutter/material.dart';

class TransactionArticle {
  String title;

  @protected
  double cost;
  List<Discount> discounts;

  TransactionArticle.empty()
      : title = '',
        cost = 0,
        discounts = [];
  TransactionArticle(this.title, this.cost, {this.discounts: const []});

  double get tot =>
      cost - discounts.fold(0.0, (prev, next) => prev + next.discount);

  void updateCost(double price) {
    cost = price;
  }
}

class Discount {
  final double discount;
  final String title;

  Discount({@required this.discount, @required this.title});
}
