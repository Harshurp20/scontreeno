import 'package:flutter/material.dart';

class TransactionArticle {
  final String title;

  @protected
  final double cost;
  final List<Discount> discounts;

  TransactionArticle(this.title, this.cost, {this.discounts: const []});

  double get tot =>
      cost - discounts.fold(0.0, (prev, next) => prev + next.discount);
}

class Discount {
  final double discount;
  final String title;

  Discount({@required this.discount, @required this.title});
}
