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

  buildView(BuildContext context) {
    //var width = (MediaQuery.of(context).size.height);
    var height = (MediaQuery.of(context).size.height);
    return Container(
      height: height,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: Dismissible(
        child: ListTile(
          title: Container(
            child: Column(
              children: [
                Text('Selam'),
              ],
            ),
          ),
        ),
        background: Container(
          color: Colors.red,
        ),
        key: ValueKey<int>(3),
        onDismissed: (DismissDirection direction) {
          setState(() {});
        },
      ),
    );
  }
}
