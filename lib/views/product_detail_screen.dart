import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/product_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/views/hamper_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  SessionModel sessionModel;
  ProductModel productModel;

  ProductDetailScreen(this.productModel, this.sessionModel);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var _number = 1, select = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: buildAppBar(context),
      body: buildView(context),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){
            Navigator.pop(context, "Hello world");
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
              onTap:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Hamper(widget.sessionModel,0)));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 10.0),
            child: Center(
              child: Text(
                "0",
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
                widget.productModel.title,
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

  Widget buildView(BuildContext context) {
    var width = (MediaQuery.of(context).size.width);
    var height = (MediaQuery.of(context).size.height);
    return Column(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width),
          height: (MediaQuery.of(context).size.height) * 0.15,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(65),
              topLeft: Radius.circular(65),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: Text(
                  widget.productModel.title,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(143, 158, 191, 1),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Text(
                    widget.productModel.description,
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromRGBO(143, 158, 191, 1),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 8.0, bottom: 8.0).copyWith(top: 0),
                child: Divider(height: 20, thickness: 2, color: Colors.black12),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          '${((widget.productModel.prices[select]['price'] as int) * _number).toString()} ${widget.productModel.prices[select]['currency']} ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(143, 158, 191, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                child: FloatingActionButton(
                                    heroTag: '+',
                                    onPressed: () {
                                      add();
                                    },
                                    child: Icon(Icons.add, color: Colors.black),
                                    backgroundColor: Colors.lightGreen),
                                width: width * 0.06,
                                height: height * 0.05),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Text(
                                _number.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(143, 158, 191, 1),
                                ),
                              ),
                            ),
                            Container(
                                child: FloatingActionButton(
                                    heroTag: '-',
                                    onPressed: () {
                                      minus();
                                    },
                                    child:
                                        Icon(Icons.remove, color: Colors.black),
                                    backgroundColor: Colors.redAccent),
                                width: width * 0.06,
                                height: height * 0.05),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Divider(
                  height: 20,
                  thickness: 2,
                  color: Colors.black12,
                ),
              ),
              Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.productModel.prices.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Divider(
                              height: 20,
                              thickness: 2,
                              color: Colors.black12,
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: 25.0, right: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.productModel
                                        .prices[index]['price_name']
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(143, 158, 191, 1),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        child: Text(
                                          'Seç',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            select = index;
                                          });
                                        },
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1)),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                      color: select == index
                                          ? Color.fromRGBO(143, 148, 251, 1)
                                          : Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Divider(
                              height: 20,
                              thickness: 2,
                              color: Colors.black12,
                            ),
                          )
                        ],
                      );
                    }),
                height: height * 0.487,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                      textStyle:
                          TextStyle(fontSize: 27, fontStyle: FontStyle.italic),
                      primary: Colors.white,
                      minimumSize: Size(88, 36),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Sepete Ekle'),
                  ),
                ),
                height: height * 0.1186,
              )
            ],
          ),
        ),
      ],
    );
  }

  void add() {
    _number += 1;
    setState(() {
      _number = _number;
    });
  }

  void minus() {
    if (_number != 1) _number -= 1;
    setState(() {
      _number;
    });
  }
}
