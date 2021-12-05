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
  late String createdAt;
  late String updatedAt;
  late String slug;
  late int iV;

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
      required this.title,
      required this.createdAt,
      required this.updatedAt,
      required this.slug,
      required this.iV});

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
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    iV = json['__v'];
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
  late int price;
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
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
