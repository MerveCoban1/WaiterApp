import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:waiter_app_demo/models/all_orders.dart';
import 'package:waiter_app_demo/models/orders_model.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';
import "package:collection/collection.dart";

class AllOrdersScreen extends StatefulWidget {
  SessionModel sessionModel;

  AllOrdersScreen(this.sessionModel);

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  var itemData,
      dimeonsion,
      exp = [],
      edit = [],
      ordersList = <AllOrders>[],
      tList,
      sList = [],
      pList = [],
      _width = 0.66,
      siparisNo = 0;
  late double toplamtutar;

  InAppService apiManagerInAppService = InAppService();
  late OrdersModel ordersModel;

  void initState() {
    super.initState();
    getAllOrders();
  }

  @override
  Widget build(BuildContext context) {
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
                itemCount: ordersList.length,
                itemBuilder: (BuildContext context, int index1) {
                  toplamtutar = 0;
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
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: ordersList[index1].orders.length,
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
                                              child: Text(
                                                ordersList[index1]
                                                    .orders[index2]
                                                    .quantity
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      143, 158, 191, 1),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: width * _width,
                                            child: Center(
                                              child: Text(
                                                '${ordersList[index1].orders[index2].productName}',
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
                                            '${ordersList[index1].orders[index2].price}₺',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  143, 158, 191, 1),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(
                                  ordersList[index1].title.toString(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(143, 158, 191, 1),
                                  ),
                                ),
                                leading: ordersList[index1].orders.isEmpty
                                    ? Icon(Icons.bookmark_border)
                                    : Icon(Icons.bookmark_outlined),
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

  Future<void> getAllOrders() async {
    var _ordersList = await apiManagerInAppService.getAllOrders(
        widget.sessionModel.refreshToken.toString(),
        widget.sessionModel.accessToken.toString());
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
