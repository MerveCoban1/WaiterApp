class MyBranch {
 late List<Categories> categories;
 late List<Products> products;
 late List<Sections> sections;
 late List<Tables> tables;
 late List<Options> options;

  MyBranch(
      {required this.categories,
     required this.products,
     required this.sections,
     required this.tables,
     required this.options});

  MyBranch.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories =<Categories>[];
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

class Categories {
  late String sId;
  late bool isSubCategory;
  late String image;
  late String title;
  late String branch;
  late String slug;
  late String? parentCategory;

  Categories(
      {required this.sId,
     required this.isSubCategory,
     required this.image,
     required this.title,
     required this.branch,
     required this.slug,
     required this.parentCategory});

  Categories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isSubCategory = json['is_sub_category'];
    image = json['image'];
    title = json['title'];
    branch = json['branch'];
    slug = json['slug'];
    parentCategory = json['parent_category'];
  }
}

class Products {
 late String sId;
 late List<int> activeList;
 late List<Options> options;
 late List<Prices> prices;
 late String endTime;
 late String startTime;
 late String image;
 late String branch;
 late String category;
 late String description;
 late String title;
 late int saleType;
 late String stockCode;

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
     required this.title,
     required this.saleType,
     required this.stockCode});

  Products.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    activeList = json['active_list'].cast<int>();
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options.add(new Options.fromJson(v));
      });
    }
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
    saleType = json['sale_type'];
    stockCode = json['stock_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['active_list'] = this.activeList;
    data['end_time'] = this.endTime;
    data['start_time'] = this.startTime;
    data['image'] = this.image;
    data['branch'] = this.branch;
    data['category'] = this.category;
    data['description'] = this.description;
    data['title'] = this.title;
    data['sale_type'] = this.saleType;
    data['stock_code'] = this.stockCode;
    return data;
  }
}

class Options {
 late String optionId;
 late bool isForcedChoice;

  Options({required this.optionId, required this.isForcedChoice});

  Options.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    isForcedChoice = json['is_forced_choice'];
  }
}

class Prices {
 late List<int> orderType;
 late String sId;
 late String priceName;
 late String currency;
 late int vatRate;
 late int amount;
 late double price;
 late String createdAt;
 late String updatedAt;
 late int saleType;

  Prices(
      {required this.orderType,
     required this.sId,
     required this.priceName,
     required this.currency,
     required this.vatRate,
     required this.amount,
     required this.price,
     required this.createdAt,
     required this.updatedAt,
     required this.saleType});

  Prices.fromJson(Map<String, dynamic> json) {
    orderType = json['order_type'].cast<int>();
    sId = json['_id'];
    priceName = json['price_name'];
    currency = json['currency'];
    vatRate = json['vat_rate'];
    amount = json['amount'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    saleType = json['sale_type'];
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

class Options_ {
 late String sId;
 late bool isForcedChoice;
 late List<Items> items;
 late int state;
 late int chooseLimit;
 late int type;
 late String specialName;
 late String name;
 late String branch;

  Options_(
      { required this.sId,
        required this.isForcedChoice,
        required this.items,
        required this.state,
        required this.chooseLimit,
        required this.type,
        required this.specialName,
        required this.name,
        required this.branch});

  Options_.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isForcedChoice = json['is_forced_choice'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
    state = json['state'];
    chooseLimit = json['choose_limit'];
    type = json['type'];
    specialName = json['special_name'];
    name = json['name'];
    branch = json['branch'];
  }
}

class Items {
  late int price;
  late int amount;
  late String sId;
  late String itemName;
  late String ingredientId;

  Items(
      {required this.price,
      required this.amount,
      required this.sId,
      required this.itemName,
      required this.ingredientId});

  Items.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    amount = json['amount'];
    sId = json['_id'];
    itemName = json['item_name'];
    ingredientId = json['ingredient_id'];
  }
}
