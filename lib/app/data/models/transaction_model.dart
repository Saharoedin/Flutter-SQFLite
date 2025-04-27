class TransactionModel {
  num? id;
  String? date;

  TransactionModel({
    this.id,
    this.date,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    return data;
  }
}
