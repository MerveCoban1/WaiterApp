class AllOrders {
 late String sId;
 late String section;
 late String title;
 late List<Orders> orders;

  AllOrders({required this.sId, required this.section, required this.title, required this.orders});

  AllOrders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    section = json['section'];
    title = json['title'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders.add(Orders.fromJson(v));
      });
    }
  }
}

class Orders {
 late String? optionsString;
 late String? sId;
 late String? productId;
 late String? productName;
 late int? quantity;
 late String? priceId;
 late String? priceName;
 late double? price;
 late String? updatedAt;
 late String? createdAt;

  Orders(
      {required this.optionsString,
       required  this.sId,
       required  this.productId,
       required  this.productName,
       required  this.quantity,
       required  this.priceId,
       required  this.priceName,
       required  this.price,
       required  this.updatedAt,
       required  this.createdAt});

  Orders.fromJson(Map<String, dynamic> json) {
    optionsString = json['optionsString'];
    sId = json['_id'];
    productId = json['productId'];
    productName = json['productName'];
    quantity = json['quantity'];
    priceId = json['priceId'];
    priceName = json['priceName'];
    price = json['price'].toDouble();
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }
}