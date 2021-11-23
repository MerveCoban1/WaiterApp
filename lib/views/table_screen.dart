import 'package:flutter/material.dart';
import 'package:waiter_app_demo/views/category_screen.dart';
import 'package:waiter_app_demo/views/product_screen.dart';

import 'order_detail_screen.dart';

class TableScreen extends StatefulWidget {
  var session;
  var floorName;
  var floorId;
  TableScreen();
  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Widget> _contents = [];
  int _activeContentNo = 0;

  @override
  void initState() {
    super.initState();
    _contents = [OrderDetail(), Category(), Product()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: buildAppBar(context),
      body: _contents[_activeContentNo],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        elevation: 0.0,
        actions: [
          Center(
            child: Text(
              "0",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.shopping_cart),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Salon-6",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _activeContentNo,
      selectedItemColor: Color.fromRGBO(143, 148, 251, 1),
      unselectedItemColor: Color.fromRGBO(143, 158, 191, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.doorbell),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer_sharp),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood_sharp),
          label: "",
        ),
      ],
      onTap: (int tiklananButonPozisyonNo) {
        setState(() {
          _activeContentNo = tiklananButonPozisyonNo;
        });
      },
    );
  }
}
