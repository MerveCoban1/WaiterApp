class MyBranch {
  late Branch branch;
  late List<Categories> categories;
  late List<Products> products;
  late List<Sections> sections;
  late List<Tables> tables;
  late List<Options> options;

  MyBranch(
      {required this.branch,
      required this.categories,
      required this.products,
      required this.sections,
      required this.tables,
      required this.options});

  MyBranch.fromJson(Map<String, dynamic> json) {
    branch =
        (json['branch'] != null ? new Branch.fromJson(json['branch']) : null)!;
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections.add(new Sections.fromJson(v));
      });
    }
    if (json['tables'] != null) {
      tables = <Tables>[];
      json['tables'].forEach((v) {
        tables.add(new Tables.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
  }
}

class Branch {
  late String sId;
  late String district;
  late String city;
  late String country;
  late String address;
  late String title;

  Branch(
      {required this.sId,
      required this.district,
      required this.city,
      required this.country,
      required this.address,
      required this.title});

  Branch.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    district = json['district'];
    city = json['city'];
    country = json['country'];
    address = json['address'];
    title = json['title'];
  }
}

class Categories {
  late String sId;
  late String image;
  late String title;
  late String branch;
  late String slug;

  Categories(
      {required this.sId,
      required this.image,
      required this.title,
      required this.branch,
      required this.slug});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    title = json['title'];
    branch = json['branch'];
    slug = json['slug'];
  }
}

class Products {
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

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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

class Sections {
  late String sId;
  late String title;

  Sections({required this.sId, required this.title});

  Sections.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
  }
}

class Tables {
  late String sId;
  late String section;
  late String title;

  Tables({required this.sId, required this.section, required this.title});

  Tables.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    section = json['section'];
    title = json['title'];
  }
}

class Options {
  late String sId;
  late List<Items> items;
  late int state;
  late int optionChooseLimit;
  late int optionType;
  late String optionSpecialName;
  late String optionName;
  late String branch;

  Options(
      {required this.sId,
      required this.items,
      required this.state,
      required this.optionChooseLimit,
      required this.optionType,
      required this.optionSpecialName,
      required this.optionName,
      required this.branch});

  Options.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    state = json['state'];
    optionChooseLimit = json['option_choose_limit'];
    optionType = json['option_type'];
    optionSpecialName = json['option_special_name'];
    optionName = json['option_name'];
    branch = json['branch'];
  }
}

class Items {
  late int price;
  late String sId;
  late String itemName;

  Items({required this.price, required this.sId, required this.itemName});

  Items.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    sId = json['_id'];
    itemName = json['item_name'];
  }
}
