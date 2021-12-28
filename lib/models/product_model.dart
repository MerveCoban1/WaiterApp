class ProductModel {
  late String sId;
  late List<int> activeList;
  late List<ProductOptions> options;
  late List<Prices> prices;
  late String? endTime;
  late String? startTime;
  late String image;
  late String branch;
  late String category;
  late String description;
  late String title;
  late String createdAt;
  late String updatedAt;
  late String slug;
  late int iV;
  late int saleType;
  late String stockCode;

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
      required this.iV,
      required this.saleType,
      required this.stockCode});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    activeList = json['active_list'].cast<int>();
    if (json['options'] != null) {
      options = <ProductOptions>[];
      json['options'].forEach((v) {
        options.add(ProductOptions.fromJson(v));
      });
    }
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices.add(Prices.fromJson(v));
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
    saleType = json['sale_type'];
    stockCode = json['stock_code'];
  }
}

class ActiveList {
  late String id;

  ActiveList({required this.id});

  ActiveList.fromJson(Map<int, dynamic> json) {
    id = json['id'];
  }
}

class ProductOptions {
  late String optionId;
  late bool isForcedChoice;

  ProductOptions({required this.optionId, required this.isForcedChoice});

  ProductOptions.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    isForcedChoice = json['is_forced_choice'];
  }
}

class Prices {
  late List<int> orderType;
  late String sId;
  late String priceName;
  late String currency;
  late double vatRate;
  late double amount;
  late double price;
  late String createdAt;
  late String updatedAt;

  Prices(
      {required this.orderType,
      required this.sId,
      required this.priceName,
      required this.currency,
      required this.vatRate,
      required this.amount,
      required this.price,
      required this.createdAt,
      required this.updatedAt});

  Prices.fromJson(Map<String, dynamic> json) {
    orderType = json['order_type'].cast<int>();
    sId = json['_id'];
    priceName = json['price_name'];
    currency = json['currency'];
    vatRate = double.parse(json['vat_rate'].toString());
    amount = double.parse(json['amount'].toString());
    price = double.parse(json['price'].toString());
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
