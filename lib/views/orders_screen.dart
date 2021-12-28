import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/orders_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import "package:collection/collection.dart";

class OrdersScreen extends StatefulWidget {
  SessionModel sessionModel;
  TableModel tableModel;
  List<Products_AddProduct> productAddProduct;

  OrdersScreen(this.sessionModel, this.tableModel, this.productAddProduct);

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
      _width = 0.66,
      siparisNo = 0;

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
            padding: const EdgeInsets.all(15.0).copyWith(top: 0, bottom: 0),
            child: Container(
              width: width,
              height: height * 0.75,
              color: Colors.white,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: dimeonsion,
                itemBuilder: (BuildContext context, int index1) {
                  var _ordersList = ordersList;
                  return Padding(
                    padding:
                        const EdgeInsets.all(8.0).copyWith(top: 0, bottom: 0),
                    child: ExpansionPanelList(
                      animationDuration: Duration(milliseconds: 1000),
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
                                            _width = 0.5;
                                            edit[index1] = !edit[index1];
                                          });
                                        },
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
                                          Container(
                                            child: Center(
                                              child: GestureDetector(
                                                child: Text(
                                                  tList[index1][index2]
                                                          ['quantity']
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        143, 158, 191, 1),
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                onTap: () {
                                                  if (edit[index1] == true) {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          StatefulBuilder(builder:
                                                              (BuildContext
                                                                      context,
                                                                  StateSetter
                                                                      setModalState) {
                                                        return AlertDialog(
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .only(
                                                                      bottom:
                                                                          0),
                                                          actionsPadding:
                                                              EdgeInsetsDirectional
                                                                  .all(0),
                                                          title: Center(
                                                              child: new Text(
                                                            tList[index1]
                                                                    [index2]
                                                                ['productName'],
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      143,
                                                                      158,
                                                                      191,
                                                                      1),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900,
                                                            ),
                                                          )),
                                                          content: Container(
                                                            height:
                                                                height * 0.22,
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                SizedBox(
                                                                    height: 7),
                                                                Text(
                                                                  'Adet Seçimi',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            143,
                                                                            158,
                                                                            191,
                                                                            1),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                NumberPicker(
                                                                    value: tList[index1]
                                                                            [index2]
                                                                        [
                                                                        'quantity'],
                                                                    minValue: 1,
                                                                    maxValue:
                                                                        100,
                                                                    step: 1,
                                                                    onChanged: (value) =>
                                                                        setModalState(
                                                                            () {
                                                                          tList[index1][index2]['quantity'] =
                                                                              value;
                                                                        })),
                                                              ],
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            // usually buttons at the bottom of the dialog
                                                            Center(
                                                              child: TextButton(
                                                                child: Text(
                                                                    "Tamam"),
                                                                style: TextButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          143,
                                                                          148,
                                                                          251,
                                                                          1),
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic),
                                                                  primary: Colors
                                                                      .white,
                                                                  minimumSize:
                                                                      Size(95,
                                                                          45),
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              16.0),
                                                                  shape:
                                                                      const BeveledRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(7)),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    tList[index1]
                                                                            [
                                                                            index2]
                                                                        [
                                                                        'quantity'] = tList[index1]
                                                                            [
                                                                            index2]
                                                                        [
                                                                        'quantity'];
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width * _width,
                                            child: Center(
                                              child: Text(
                                                '${tList[index1][index2]['productName']}',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      143, 158, 191, 1),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${tList[index1][index2]['price']}₺',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  143, 158, 191, 1),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          if (edit[index1] == true)
                                            IconButton(
                                              color: Colors.redAccent,
                                              icon: Icon(Icons.delete_forever,
                                                  size: 22),
                                              onPressed: () async {
                                                await apiManagerInAppService
                                                    .deleteOrders(
                                                        widget.sessionModel
                                                            .refreshToken,
                                                        widget.sessionModel
                                                            .accessToken,
                                                        widget.tableModel.id,
                                                        tList[index1][index2]
                                                            ['_id'],
                                                        tList[index1][index2]
                                                            ['productId'],
                                                        tList[index1][index2]
                                                            ['quantity']);
                                                await getOrders();
                                                await listGet();
                                              },
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
                                        fontSize: 16,
                                        color: Color.fromRGBO(143, 158, 191, 1),
                                        fontWeight: FontWeight.w700,
                                      ),
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
                                  "Sipariş No: ${index1 + 1}",
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

  int listGet() {
    if (ordersList.length != 0) {
      var arrayLenght = 0,
          i = 0,
          j = 0,
          first = 0,
          a = ordersList.length,
          b = ordersList.length;
      sList = [];
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
        var sayac = 0, totalPrice = 0.0, empty = true;
        element.forEach((_element) {
          if (_element.isNotEmpty) {
            sayac++;
            totalPrice += (_element['price'].toDouble());
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
        dimeonsion = arrayLenght;
        tList = tList;
        sList = sList;
      });
      return arrayLenght;
    } else {
      setState(() {
        dimeonsion = 0;
      });
      return 0;
    }
  }

  Future<void> getOrders() async {
    var _ordersList = await apiManagerInAppService.getOrders(
        widget.sessionModel.refreshToken.toString(),
        widget.sessionModel.accessToken.toString(),
        widget.tableModel.id.toString());
    if (_ordersList.isNotEmpty) {
      setState(() {
        ordersList = _ordersList;
        exp = (List.generate(ordersList.length, (index) => false));
        edit = (List.generate(ordersList.length, (index) => false));
      });
    } else {
      setState(() {
        ordersList = [];
      });
    }
  }
}
