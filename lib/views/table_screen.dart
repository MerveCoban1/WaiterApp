import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/views/category_screen.dart';
import 'package:waiter_app_demo/views/table_detail_screen.dart';
import 'hamper_screen.dart';
import 'orders_screen.dart';

class TableScreen extends StatefulWidget {
  TableModel tableModel;
  SessionModel sessionModel;
  List<Products_AddProduct> productAddProduct;
  int activeContentNo;

  TableScreen(this.tableModel, this.sessionModel, this.productAddProduct,
      this.activeContentNo);

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<Widget> _contents = [];
  var deger = 0;

  @override
  void initState() {
    super.initState();
    setState(() {});
    _contents = [
     /* TableDetailScreen(
          widget.tableModel, widget.sessionModel, widget.productAddProduct),*/
      CategoryScreen(
          widget.sessionModel, widget.tableModel, widget.productAddProduct),
      OrdersScreen(
          widget.sessionModel, widget.tableModel, widget.productAddProduct)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: buildAppBar(context),
      body: _contents[widget.activeContentNo],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 11.0),
            child: GestureDetector(
              child: Icon(Icons.shopping_cart),
              onTap: widget.productAddProduct.isNotEmpty? () async {
                widget.productAddProduct = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Hamper(widget.sessionModel,
                            widget.productAddProduct, widget.tableModel)));
                setState(() {
                  widget.productAddProduct = widget.productAddProduct;
                });
              }:null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10.0),
            child: Center(
              child: Text(
                widget.productAddProduct.length.toString(),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text(
                widget.tableModel.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: widget.activeContentNo,
      selectedItemColor: Color.fromRGBO(143, 148, 251, 1),
      unselectedItemColor: Color.fromRGBO(143, 158, 191, 1),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        /*BottomNavigationBarItem(
          icon: Icon(Icons.details),
          label: "",
        ),*/
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_sharp),
          label: "",
        ),
      ],
      onTap: (int tiklananButonPozisyonNo) {
        ScaffoldMessenger.of(context).clearSnackBars();
        if (tiklananButonPozisyonNo != 1) {
          setState(() {
            widget.activeContentNo = tiklananButonPozisyonNo;
          });
        } else if (widget.tableModel.orders.isNotEmpty) {
          setState(() {
            widget.activeContentNo = tiklananButonPozisyonNo;
          });
        } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Masada Sipariş Bulunmamaktadır.",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ));

        }
      },
    );
  }
}
