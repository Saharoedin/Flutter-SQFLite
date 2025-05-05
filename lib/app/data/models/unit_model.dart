class Unit {
  num? id;
  String? name;

  Unit({
    this.id,
    this.name,
  });

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  static List<Unit> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<Unit>.empty();
    return data
        .map(
          (e) => Unit.fromJson(e),
        )
        .toList();
  }
}
