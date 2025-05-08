class TransactionDetail {
  num? id;
  num? transactionId;
  num? productId;
  num? qty;
  num? price;
  num? discount;
  num? tax;
  num? total;

  TransactionDetail({
    this.id,
    this.transactionId,
    this.productId,
    this.qty,
    this.price,
    this.discount,
    this.tax,
    this.total,
  });

  TransactionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    transactionId = json['transaction_id'] as num?;
    productId = json['product_id'] as num?;
    qty = json['qty'] as num?;
    price = json['price'] as num?;
    discount = json['discount'] as num?;
    tax = json['tax'] as num?;
    total = json['total'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_id'] = transactionId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['price'] = price;
    data['discount'] = discount;
    data['tax'] = tax;
    data['total'] = total;
    return data;
  }

  static List<TransactionDetail> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<TransactionDetail>.empty();

    return data
        .map(
          (e) => TransactionDetail.fromJson(e),
        )
        .toList();
  }
}
