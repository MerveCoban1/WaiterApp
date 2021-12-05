import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/session_model.dart';

class Hamper extends StatefulWidget {
  SessionModel sessionModel;
  List<Products_AddProduct> hamper;

  Hamper(this.sessionModel, this.hamper);

  @override
  _HamperState createState() => _HamperState();
}

class _HamperState extends State<Hamper> {
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
        iconTheme: IconThemeData(
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
          child: Text(
            "Sepet",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
          ),
        ),
      ),
    );
  }
  //var a= Hamper();
  buildView(BuildContext context) {
    //var width = (MediaQuery.of(context).size.height);
    var height = (MediaQuery.of(context).size.height);
    return Container(
      height: height,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      /*child: Stack(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: widget.hamper.products.length,
            itemBuilder:
                (BuildContext context, int index2) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 4.0),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${tList[index1][index2]['quantity']}x',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          letterSpacing: 0.3,
                          height: 1.3),
                    ),
                    Text(
                      '${tList[index1][index2]['productName']}',
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          letterSpacing: 0.3,
                          height: 1.3),
                    ),
                    Row(
                      children: [
                        Text(
                          '${tList[index1][index2]['price']}₺',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              letterSpacing: 0.3,
                              height: 1.3),
                        ),
                        edit[index1] == true
                            ? Container(
                          width: width * 0.28,
                          child: Row(
                            children: [
                              IconButton(
                                color: Colors
                                    .redAccent,
                                icon: Icon(
                                    Icons
                                        .delete_forever,
                                    size: 22),
                                onPressed: () {
                                  InAppService
                                  deleteOrders =
                                  InAppService();
                                  deleteOrders.deleteOrders(
                                      widget
                                          .sessionModel
                                          .refreshToken,
                                      widget
                                          .sessionModel
                                          .accessToken,
                                      widget
                                          .tableModel
                                          .id,
                                      tList[index1][
                                      index2]
                                      ['_id'],
                                      tList[index1][
                                      index2]
                                      [
                                      'productId'],
                                      removList[
                                      index1]
                                      [index2]);
                                  getOrders();
                                  listGet();
                                },
                              ),
                              Container(
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceEvenly,
                                    children: <
                                        Widget>[
                                      Container(
                                          child: FloatingActionButton(
                                              onPressed: () {
                                                add(index1,
                                                    index2);
                                              },
                                              child: Icon(Icons.add, color: Colors.black),
                                              backgroundColor: Colors.white),
                                          width: width * 0.06,
                                          height: height * 0.05),
                                      Text(
                                        removList[index1]
                                        [
                                        index2]
                                            .toString(),
                                        style: TextStyle(
                                            fontSize:
                                            16.0),
                                      ),
                                      Container(
                                          child: FloatingActionButton(
                                              onPressed: () {
                                                minus(index1,
                                                    index2);
                                              },
                                              child: Icon(Icons.remove, color: Colors.black),
                                              backgroundColor: Colors.white),
                                          width: width * 0.06,
                                          height: height * 0.05),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                            : Padding(
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),*/
    );
  }
}
