class OrderQueryModel {
  final int addressId;
  final int paymentMethod;
  final bool usePoints;
  final int promoCodeId;

  OrderQueryModel(
      {required this.addressId,
      required this.paymentMethod,
      required this.usePoints,
      required this.promoCodeId});
}

class OrderModel {
  final int id;
  final int total;
  final String date;
  final String status;

  OrderModel({
    required this.id,
    required this.total,
    required this.date,
    required this.status,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      total: json['total'].round(),
      date: json['date'],
      status: json['status'],
    );
  }
}
