class Receipt {
  String shopName;
  double tot;
  String shopImageURL;
  DateTime time;
  final bool isFiscale;
  final bool isTemporaneo;

  Receipt({
    this.shopImageURL,
    this.shopName,
    this.tot,
    this.isFiscale,
    this.isTemporaneo,
    this.time,
  });
}
