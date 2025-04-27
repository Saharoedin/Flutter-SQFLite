class TransactionDetail {
  num? id;
  num? transactionId;
  num? productId;
  num? qty;

  TransactionDetail({
    this.id,
    this.transactionId,
    this.productId,
    this.qty,
  });

  TransactionDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    transactionId = json['transaction_id'] as num?;
    productId = json['product_id'] as num?;
    qty = json['qty'] as num?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_id'] = transactionId;
    data['product_id'] = productId;
    data['qty'] = qty;
    return data;
  }
}
