class OrdersModel {
  var orders=<Orders>[];
  OrdersModel({required this.orders});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders.add(new Orders.fromJson(v));
      });
    }
  }
}

class Orders {
  late String sId;
  late String productId;
  late String productName;
  late int quantity;
  late String priceId;
  late String priceName;
  late int price;
  late String updatedAt;
  late String createdAt;

  Orders(
      {required this.sId,
        required this.productId,
        required this.productName,
        required this.quantity,
        required this.priceId,
        required this.priceName,
        required this.price,
        required this.updatedAt,
        required this.createdAt});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productId = json['productId'];
    productName = json['productName'];
    quantity = json['quantity'];
    priceId = json['priceId'];
    priceName = json['priceName'];
    price = json['price'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }
}