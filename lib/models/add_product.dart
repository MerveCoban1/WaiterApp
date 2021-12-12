class AddProduct {
  late List<Products_AddProduct> products;

  AddProduct({required this.products});
}

class Products_AddProduct {
  late double totalPrice;
  late String productSelect;
  late String productId;
  late int quantity;
  late String priceId;
  late String currency;
  late List<Options_AddProduct> options;
  late String description;
  late String title;

  Products_AddProduct({
    required this.totalPrice,
    required this.productSelect,
    required this.productId,
    required this.quantity,
    required this.priceId,
    required this.currency,
    required this.options,
    required this.description,
    required this.title,
  });
}

class Options_AddProduct {
  late String id;
  late String option_name;
  late String subOptionReply;
  late List<String> subOption;

  Options_AddProduct(
      {required this.id,
      required this.option_name,
      required this.subOptionReply,
      required this.subOption});
}
