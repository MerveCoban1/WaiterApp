class Hampers {
  late List<Product> product;

  Hampers({required this.product});
}

class Product {
  late String product;
  late String productTitle;
  late String productDescription;
  late int quantity;
  late String price;
  late int priceTotal;
  late List<Optionn> options;

  Product(
      {required this.product,
      required this.productTitle,
      required this.productDescription,
      required this.quantity,
      required this.price,
      required this.priceTotal,
      required this.options});
}

class Optionn {
  late String id;
  late List<String> subOption;

  Optionn({required this.id, required this.subOption});
}
