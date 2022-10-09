class Transaction {
  String? sId;
  String? message;
  late String status;
  late PriceMap total;
  late PriceMap price;
  late PriceMap fee;
  late PriceMap receive;
  late String createdAt;
  String? updatedAt;
  int? iV;

  Transaction(
      {this.sId,
      this.message,
      required this.status,
      required this.total,
      required this.price,
      required this.fee,
      required this.receive,
      required this.createdAt,
      this.updatedAt,
      this.iV});

  Transaction.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'].toUpperCase();
    message = json['message'];
    total = PriceMap.fromJson(json['total']);
    price = PriceMap.fromJson(json['price']);
    fee = PriceMap.fromJson(json['fee']);
    receive = PriceMap.fromJson(json['receive']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['status'] = status;
    data['message'] = message;
    data['total'] = total.toJson();
    data['price'] = price.toJson();
    data['fee'] = fee.toJson();
    data['receive'] = receive.toJson();
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }

  static List<Transaction> resolveList(List<dynamic>? data) {
    if (data == null) return [];
    final items = data.map((item) => Transaction.fromJson(item));
    return List<Transaction>.from(items);
  }
}

class PriceMap {
  late String unit;
  late String amount;

  PriceMap({required this.unit, required this.amount});

  PriceMap.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit'] = unit;
    data['amount'] = amount;
    return data;
  }
}

class Plan {
  String? sId;
  String? user;
  String? market;
  String? name;
  int? amount;
  bool? isActive;
  String? schedule;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Plan(
      {this.sId,
      this.user,
      this.market,
      this.name,
      this.amount,
      this.isActive,
      this.schedule,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Plan.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    market = json['market'];
    name = json['name'];
    amount = json['amount'];
    isActive = json['isActive'];
    schedule = json['schedule'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['market'] = market;
    data['name'] = name;
    data['amount'] = amount;
    data['isActive'] = isActive;
    data['schedule'] = schedule;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
