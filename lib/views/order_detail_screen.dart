import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

var totalPrice = 0;
var orderNo = 100010;
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
final List<int> quantity = <int>[1, 2, 10, 6, 2, 4, 1, 3];

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    print(widget.key);
    var width = (MediaQuery.of(context).size.height);
    var height = (MediaQuery.of(context).size.height);
    return Column(
      children: [
        Container(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Toplam Tutar: ",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${totalPrice.toString()}₺",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  width: width * 0.15,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      "No: ${orderNo}",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Yazdır",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Taşı",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightGreen),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightBlue),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.add, size: 18),
                              ),
                              TextSpan(
                                text: "Ekle",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          debugPrint("Butona tıklandı");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0,left: 12.0,right: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${quantity[index]}x',
                          style: TextStyle(fontSize: 18, color: Colors.white),
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
