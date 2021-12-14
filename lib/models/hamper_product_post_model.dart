class HamperProductPost {
  late List<ProductsPost> products;

  HamperProductPost({required this.products});

  HamperProductPost.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsPost>[];
      json['products'].forEach((v) {
        products.add(new ProductsPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductsPost {
  late String product;
  late int quantity;
  late String price;
  late List<OptionsPost> options;
  late List<String> discount;

  ProductsPost(
      {required this.product,
      required this.quantity,
      required this.price,
      required this.options,
      required this.discount});

  ProductsPost.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
    price = json['price'];
    if (json['options'] != null) {
      options = <OptionsPost>[];
      json['options'].forEach((v) {
        options.add(new OptionsPost.fromJson(v));
      });
    }
    discount = json['discount'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    data['discount'] = this.discount;
    return data;
  }
}

class OptionsPost {
  late String id;
  late List<String> subOption;

  OptionsPost({required this.id, required this.subOption});

  OptionsPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subOption = json['sub_option'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sub_option'] = this.subOption;
    return data;
  }
}
