class ProductModel {
  late String sId;
  late List<int> activeList;
  late List<String> options;
  late List<Prices> prices;
  late String endTime;
  late String startTime;
  late String image;
  late String branch;
  late String category;
  late String description;
  late String title;

  ProductModel(
      {required this.sId,
      required this.activeList,
      required this.options,
      required this.prices,
      required this.endTime,
      required this.startTime,
      required this.image,
      required this.branch,
      required this.category,
      required this.description,
      required this.title});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    activeList = json['active_list'].cast<int>();
    options = json['options'].cast<String>();
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices.add(new Prices.fromJson(v));
      });
    }
    endTime = json['end_time'];
    startTime = json['start_time'];
    image = json['image'];
    branch = json['branch'];
    category = json['category'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['active_list'] = this.activeList;
    data['options'] = this.options;
    if (this.prices != null) {
      data['prices'] = this.prices.map((v) => v.toJson()).toList();
    }
    data['end_time'] = this.endTime;
    data['start_time'] = this.startTime;
    data['image'] = this.image;
    data['branch'] = this.branch;
    data['category'] = this.category;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}

class Prices {
  late String sId;
  late String priceName;
  late String currency;
  late int vatRate;
  late int saleType;
  late int orderType;
  late int amount;
  late double price;
  late String createdAt;
  late String updatedAt;

  Prices(
      {required this.sId,
      required this.priceName,
      required this.currency,
      required this.vatRate,
      required this.saleType,
      required this.orderType,
      required this.amount,
      required this.price,
      required this.createdAt,
      required this.updatedAt});

  Prices.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    priceName = json['price_name'];
    currency = json['currency'];
    vatRate = json['vat_rate'];
    saleType = json['sale_type'];
    orderType = json['order_type'];
    amount = json['amount'];
    price = json['price'].toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price_name'] = this.priceName;
    data['currency'] = this.currency;
    data['vat_rate'] = this.vatRate;
    data['sale_type'] = this.saleType;
    data['order_type'] = this.orderType;
    data['amount'] = this.amount;
    data['price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
