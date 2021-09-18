import 'package:hive/hive.dart';
part 'order_item.g.dart';

@HiveType(typeId: 1)
class OrderItem extends HiveObject {
  @HiveField(0)
  late String orderPartnerId;

  @HiveField(1)
  late String orderRiderId;

  @HiveField(2)
  late String orderDateTime;

  @HiveField(3)
  late String orderType;

  @HiveField(4)
  late List<OrderLines> orderLines;

  OrderItem({
    required this.orderPartnerId,
    required this.orderRiderId,
    required this.orderDateTime,
    required this.orderType,
    required this.orderLines,
  });

  OrderItem.fromJson(Map<String, dynamic> json) {
    orderPartnerId = json['order_partner_id'];
    orderRiderId = json['order_rider_id'];
    orderDateTime = json['order_dateTime'];
    orderType = json['order_type'];
    if (json['order_lines'] != null) {
      orderLines = [];
      json['order_lines'].forEach((v) {
        orderLines.add(new OrderLines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_partner_id'] = this.orderPartnerId;
    data['order_rider_id'] = this.orderRiderId;
    data['order_dateTime'] = this.orderDateTime;
    data['order_type'] = this.orderType;
    if (this.orderLines != null) {
      data['order_lines'] = this.orderLines.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return "partner_id: ${this.orderPartnerId} rider_id: ${this.orderPartnerId} order_date: ${this.orderDateTime} order_type: ${this.orderType} order_line: ${this.orderLines}";
  }
}

@HiveType(typeId: 2)
class OrderLines {
  @HiveField(0)
  late int productWeight;

  @HiveField(1)
  late int productTotalWeight;

  @HiveField(2)
  late int productQuantity;

  OrderLines({
    required this.productWeight,
    required this.productTotalWeight,
    required this.productQuantity,
  });

  @override
  String toString() {
    return "weight : ${this.productWeight} | total_weight : ${this.productTotalWeight} | qty : ${this.productQuantity}";
  }

  OrderLines.fromJson(Map<String, dynamic> json) {
    productWeight = json['product_weight'];
    productTotalWeight = json['product_total_weight'];
    productQuantity = json['product_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_weight'] = this.productWeight;
    data['product_total_weight'] = this.productTotalWeight;
    data['product_quantity'] = this.productQuantity;
    return data;
  }
}
