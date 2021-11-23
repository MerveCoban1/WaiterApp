import 'package:flutter/material.dart';

final List<String> product = <String>[
  'ICE TEA LIMON',
  'NANELI LIMONATA',
  'ICE TEA LIMON',
  'NANELI LIMONATA',
  'ICE TEA LIMON',
  'NANELI LIMONATA',
  'ICE TEA LIMON',
  'NANELI LIMONATA',
];
final List<double> price = [
  22.00,
  20.50,
  10.00,
  6.05,
  52.00,
  4.00,
  100.00,
  20.00
];

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  color: Colors.black38,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.food_bank_outlined,
                          color: Colors.white,
                          size: 26,
                        ),
                        Text(
                          '${product[index]}',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text(
                          '${price[index]}₺',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
