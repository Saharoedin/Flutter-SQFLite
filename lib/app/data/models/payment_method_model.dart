class PaymentMethod {
  num? id;
  String? name;
  String? reference;

  PaymentMethod({
    this.id,
    this.name,
    this.reference,
  });

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    name = json['name'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['reference'] = reference;
    return data;
  }

  static List<PaymentMethod> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<PaymentMethod>.empty();
    return data
        .map(
          (e) => PaymentMethod.fromJson(e),
        )
        .toList();
  }
}
