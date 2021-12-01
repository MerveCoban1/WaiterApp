import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/item.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import "package:collection/collection.dart";

class OrdersScreen extends StatefulWidget {
  SessionModel sessionModel;
  TableModel tableModel;

  OrdersScreen(this.sessionModel, this.tableModel);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  var itemData,
      dimeonsion,
      exp = [],
      edit = [],
      ordersList = [],
      tList,
      sList = [],
      pList = [],
      removList;

  InAppService apiManagerInAppService = InAppService();
  late OrdersModel ordersModel;

  void initState() {
    super.initState();
    getOrders();
  }

  Widget build(BuildContext context) {
    dimeonsion = listGet();
    return buildContainer(context, ordersList);
  }

  Container buildContainer(BuildContext context, var item) {
    var width = (MediaQuery.of(context).size.width);
    var height = (MediaQuery.of(context).size.height);
    return Container(
      width: width,
      height: height,
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
              width: width,
              height: height * 0.69,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dimeonsion,
                itemBuilder: (BuildContext context, int index1) {
                  var _ordersList = ordersList;
                  return Padding(
                    padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                    child: ExpansionPanelList(
                      animationDuration: Duration(milliseconds: 1000),
                      dividerColor: Colors.red,
                      elevation: 1,
                      children: [
                        ExpansionPanel(
                          body: Container(
                            padding:
                                EdgeInsets.only(left: 10, right: 10, bottom: 10)
                                    .copyWith(top: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        color: Colors.lightGreen,
                                        icon: Icon(Icons.edit, size: 22),
                                        onPressed: () {
                                          setState(() {
                                            edit[index1] = !edit[index1];
                                          });
                                        },
                                      ),
                                      IconButton(
                                        color: Colors.lightBlue,
                                        icon: Icon(Icons.add, size: 22),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: sList[index1],
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, right: 4.0),
                                    child: Text(
                                      "Toplam Tutar: ${pList[index1]}₺",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 16,
                                          letterSpacing: 0.3,
                                          height: 1.3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            //burayı func içine alabiliriz...
                            var date = _ordersList[index1]["createdAt"]
                                .toString()
                                .substring(0, 10);
                            var dateDay = date.split("-");
                            var createOrderDate = dateDay[2] +
                                "/" +
                                dateDay[1] +
                                "/" +
                                dateDay[0];
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  "Sipariş No: 12345",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(143, 158, 191, 1),
                                  ),
                                ),
                                subtitle: Text(
                                  createOrderDate,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(143, 158, 191, 1),
                                  ),
                                ),
                                leading: Icon(Icons.bookmark_border),
                              ),
                            );
                          },
                          isExpanded: exp[index1],
                        )
                      ],
                      expansionCallback: (int item, bool status) {
                        setState(() {
                          exp[index1] = !exp[index1];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void add(int index1, int index2) {
    removList[index1][index2] += 1;
    setState(() {
      removList = removList;
    });
  }

  void minus(int index1, int index2) {
    if (removList[index1][index2] != 0) removList[index1][index2] -= 1;
    setState(() {
      removList = removList;
    });
  }

  int listGet() {
    var arrayLenght = 0,
        i = 0,
        j = 0,
        first = 0,
        a = ordersList.length,
        b = ordersList.length;
    removList = List.generate(a, (i) => List.filled(b, 0, growable: false));
    tList = List.generate(a, (i) => List.filled(b, Map(), growable: false),
        growable: false);
    var groupByDate = groupBy(
        ordersList, (obj) => (obj as Map)['createdAt'].substring(0, 10));
    groupByDate.forEach((date, list) {
      list.forEach((listItem) {
        var _createAt = (listItem as Map)['createdAt'];
        if (first == 0) {
          tList[i][j] = listItem;
          first++;
        } else if ((tList[i][j] as Map)['createdAt'].toString() !=
            _createAt.toString()) {
          i++;
          j = 0;
          tList[i][j] = listItem;
        } else {
          j++;
          tList[i][j] = listItem;
        }
      });
    });
    tList.forEach((element) {
      var sayac = 0, totalPrice = 0, empty = true;
      element.forEach((_element) {
        if (_element.isNotEmpty) {
          sayac++;
          totalPrice += (_element['price'] as int);
          empty = false;
        }
      });
      if (!empty) {
        sList.add(sayac);
        pList.add(totalPrice);
        arrayLenght++;
      }
    });

    setState(() {
      tList = tList;
      sList = sList;
      removList;
    });
    return arrayLenght;
  }

  Future<void> getOrders() async {
    var _ordersList = await apiManagerInAppService.getOrders(
        widget.sessionModel.refreshToken.toString(),
        widget.sessionModel.accessToken.toString(),
        widget.tableModel.id.toString());
    if (_ordersList.isEmpty) {
    } else {
      setState(() {
        ordersList = _ordersList;
        exp = (List.generate(ordersList.length, (index) => false));
        edit = (List.generate(ordersList.length, (index) => false));
      });
    }
  }
}
