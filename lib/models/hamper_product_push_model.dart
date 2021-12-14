class HamperProductPut {
  late List<ProductsPut> products;

  HamperProductPut({required this.products});

  HamperProductPut.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductsPut>[];
      json['products'].forEach((v) {
        products.add(new ProductsPut.fromJson(v));
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

class ProductsPut {
  late String product;
  late int quantity;
  late String price;
  late List<OptionsPut> options;

  ProductsPut(
      {required this.product,
      required this.quantity,
      required this.price,
      required this.options});

  ProductsPut.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
    price = json['price'];
    if (json['options'] != null) {
      options = <OptionsPut>[];
      json['options'].forEach((v) {
        options.add(new OptionsPut.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OptionsPut {
  late String id;
  late List<String> subOption;

  OptionsPut({required this.id, required this.subOption});

  OptionsPut.fromJson(Map<String, dynamic> json) {
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
