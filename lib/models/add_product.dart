class AddProduct {
  late List<Products_AddProduct> products;

  AddProduct({required this.products});
}

class Products_AddProduct {
  late String product;
  late int quantity;
  late String price;
  late List<Options_AddProduct> options;
  late String description;
  late String title;

  Products_AddProduct({
    required this.product,
    required this.quantity,
    required this.price,
    required this.options,
    required this.description,
    required this.title,
  });
}

class Options_AddProduct {
  late String id;
  late List<String> subOption;

  Options_AddProduct({required this.id, required this.subOption});
}
