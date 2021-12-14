import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:waiter_app_demo/models/add_product.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/models/table_model.dart';
import 'package:waiter_app_demo/services/in_app_service.dart';

class Hamper extends StatefulWidget {
  SessionModel sessionModel;
  List<Products_AddProduct> hamper;
  TableModel tableModel;

  Hamper(this.sessionModel, this.hamper, this.tableModel);

  @override
  _HamperState createState() => _HamperState();
}

class _HamperState extends State<Hamper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildView(context),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromRGBO(143, 148, 251, 1)),
          onPressed: () {
            Navigator.pop(context, widget.hamper);
          },
        ),
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

  buildView(BuildContext context) {
    InAppService apiManagerInAppService = InAppService();
    var TotalPrice = 0.0;
    var width = (MediaQuery.of(context).size.height);
    var height = (MediaQuery.of(context).size.height);
    widget.hamper.forEach((element) {
      TotalPrice += (element.totalPrice * element.quantity);
    });
    return Stack(
      children: [
        Container(
          height: height * 0.8,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          child: ListView.builder(
            itemCount: widget.hamper.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
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
                  child: Column(
                    children: [
                      Dismissible(
                        child: ListTile(
                          leading: Container(
                            width: width * 0.040,
                            height: height * 0.040,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff707070)),
                            ),
                            child: Center(
                              child: GestureDetector(
                                child: Text(
                                  widget.hamper[index].quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(143, 158, 191, 1),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                onTap: () {
                                  var val = widget.hamper[index].quantity;
                                  showDialog(
                                    context: context,
                                    builder: (context) => StatefulBuilder(
                                        builder: (BuildContext context,
                                            StateSetter setModalState) {
                                      return AlertDialog(
                                        contentPadding:
                                            EdgeInsetsDirectional.only(
                                                bottom: 0),
                                        actionsPadding:
                                            EdgeInsetsDirectional.all(0),
                                        title: Center(
                                            child: new Text(
                                          widget.hamper[index].title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(
                                                143, 158, 191, 1),
                                            fontWeight: FontWeight.w900,
                                          ),
                                        )),
                                        content: Container(
                                          height: height * 0.22,
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(height: 7),
                                              Text(
                                                'Adet Seçimi',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      143, 158, 191, 1),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              NumberPicker(
                                                  value: val,
                                                  minValue: 1,
                                                  maxValue: 100,
                                                  step: 1,
                                                  onChanged: (value) =>
                                                      setModalState(() {
                                                        val = value;
                                                      })),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          // usually buttons at the bottom of the dialog
                                          Center(
                                            child: new TextButton(
                                              child: new Text("Tamam"),
                                              style: TextButton.styleFrom(
                                                backgroundColor: Color.fromRGBO(
                                                    143, 148, 251, 1),
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    fontStyle:
                                                        FontStyle.italic),
                                                primary: Colors.white,
                                                minimumSize: Size(95, 45),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.0),
                                                shape:
                                                    const BeveledRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7)),
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  widget.hamper[index]
                                                      .quantity = val;
                                                });
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          ),
                          title: Text(
                            widget.hamper[index].title.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(143, 158, 191, 1),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text(
                              TextGet(index),
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(143, 158, 191, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          trailing: Text(
                            '${(widget.hamper[index].totalPrice * widget.hamper[index].quantity).toString() + widget.hamper[index].currency.toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(143, 158, 191, 1),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        background: Container(
                          color: Colors.red,
                        ),
                        key: UniqueKey(),
                        onDismissed: (DismissDirection direction) {
                          widget.hamper.removeAt(index);
                          setState(() {
                            widget.hamper = widget.hamper;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.0),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            width: width,
            height: height * 0.1,
            child: Row(
              children: [
                Container(
                  width: width * 0.27,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Toplam',
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromRGBO(143, 158, 191, 1),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          '$TotalPrice',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(143, 158, 191, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                        textStyle: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                        primary: Colors.white,
                        minimumSize: Size(95, 45),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                      ),
                      onPressed: () async {
                        widget.tableModel.busy
                            ? await apiManagerInAppService.putCreateOrder(
                                widget.sessionModel.refreshToken,
                                widget.sessionModel.accessToken,
                                widget.hamper,
                                widget.tableModel)
                            : await apiManagerInAppService.postCreateOrder(
                                widget.sessionModel.refreshToken,
                                widget.sessionModel.accessToken,
                                widget.hamper,
                                widget.tableModel);
                        setState(() {
                          widget.hamper = [];
                        });
                        Navigator.pop(context, widget.hamper);
                      },
                      child: Text('Sepeti Onayla'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String TextGet(int index) {
    String text = '| ${widget.hamper[index].productSelect} | ';
    widget.hamper[index].options.forEach((element) {
      text += '${element.option_name}: ${element.subOptionReply} | ';
    });
    return text;
  }
}
