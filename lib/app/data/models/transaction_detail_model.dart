class TransactionDetail {
  int? id;
  int? transactionId;
  int? productId;
  int? qty;
  double? price;
  double? discount;
  double? total;

  TransactionDetail({
    this.id,
    this.transactionId,
    this.productId,
    this.qty,
    this.price,
    this.discount,
    this.total,
  });

  TransactionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    productId = json['product_id'];
    qty = json['qty'];
    price = json['price'];
    discount = json['discount'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_id'] = transactionId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['price'] = price;
    data['discount'] = discount;
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
