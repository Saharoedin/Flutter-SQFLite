class Transaction {
  num? id;
  String? date;
  String? orderType;
  num? subTotal;
  num? discount;
  num? tax;
  num? grandTotal;
  String? status;
  num? paymentId;
  String? createdAt;
  String? updatedAt;

  Transaction({
    this.id,
    this.date,
    this.orderType,
    this.subTotal,
    this.discount,
    this.tax,
    this.grandTotal,
    this.status,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    date = json['date'];
    orderType = json['order_type'];
    subTotal = json['sub_total'] as num?;
    discount = json['discount'] as num?;
    tax = json['tax'] as num?;
    grandTotal = json['grand_total'] as num?;
    status = json['status'];
    paymentId = json['payment_id'] as num?;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['order_type'] = orderType;
    data['sub_total'] = subTotal;
    data['discount'] = discount;
    data['tax'] = tax;
    data['grand_total'] = grandTotal;
    data['status'] = status;
    data['payment_id'] = paymentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  static List<Transaction> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<Transaction>.empty();

    return data
        .map(
          (e) => Transaction.fromJson(e),
        )
        .toList();
  }
}
