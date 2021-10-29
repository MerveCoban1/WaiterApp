import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {

  @override
  Widget build(BuildContext context) {
    return buildContainer(context);
  }

  Container buildContainer(BuildContext context) {
    return Container(
    width: (MediaQuery.of(context).size.width),
    height: (MediaQuery.of(context).size.height),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(65),
        topLeft: Radius.circular(65),
      ),
    ),
    child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Center(
            child: Text(
              "SİPARİŞLER",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(143, 158, 191, 1),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: (MediaQuery.of(context).size.width),
            height: (MediaQuery.of(context).size.height)*0.69,
            color: Colors.white,
            child: ListView(
              children: [
                ListTile(
                  title: Text("Sipariş No: 12345",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(143, 158, 191, 1),
                    ),
                  ),
                  subtitle: Text("15.06.1998",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(143, 158, 191, 1),
                    ),
                  ),
                  leading: Icon(Icons.bookmark_border),
                  trailing: Icon(Icons.double_arrow)
                ),
                Container(
                  width: (MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 100),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          10.0, // Move to bottom 10 Vertically
                        ),
                      ),
                    ],
                  ),
                  child: Text(""),
                ),
                ListTile(
                    title: Text("Sipariş No: 12345",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 158, 191, 1),
                      ),
                    ),
                    subtitle: Text("15.06.1998",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(143, 158, 191, 1),
                      ),
                    ),
                    leading: Icon(Icons.bookmark_border),
                    trailing: Icon(Icons.double_arrow)
                ),
                Container(
                  width: (MediaQuery.of(context).size.height),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(143, 148, 251, 100),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 0.0, //extend the shadow
                        offset: Offset(
                          0.0, // Move to right 10  horizontally
                          10.0, // Move to bottom 10 Vertically
                        ),
                      ),
                    ],
                  ),
                  child: Text(""),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }

}