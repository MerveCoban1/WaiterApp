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
    var width = (MediaQuery.of(context).size.height);
    var height = (MediaQuery.of(context).size.height);
    return Container(
      height: height,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
      child: ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Dismissible(
                child: ListTile(
                  leading: Container(
                    width: width * 0.035,
                    height: height * 0.035,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      border: Border.all(
                          width: 1.0, color: const Color(0xff707070)),
                    ),
                    child: Center(
                      child: GestureDetector(
                        child: Text('0'),
                        onTap: () {},
                      ),
                    ),
                  ),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                ),
                background: Container(
                  color: Colors.red,
                ),
                key: ValueKey<int>(1),
                onDismissed: (DismissDirection direction) {
                  setState(() {});
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
