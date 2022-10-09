class Market {
  late String id;
  late String name;
  late String baseUnit;
  late String quoteUnit;
  late String createdAt;
  late String updatedAt;
  late int iV;

  Market(
      {required this.id,
      required this.name,
      required this.baseUnit,
      required this.quoteUnit,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    baseUnit = json['base_unit'];
    quoteUnit = json['quote_unit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['base_unit'] = baseUnit;
    data['quote_unit'] = quoteUnit;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  static List<Market> resolveList(List<dynamic>? data) {
    if (data == null) return [];
    final items = data.map((item) => Market.fromJson(item));
    return List<Market>.from(items);
  }
}
