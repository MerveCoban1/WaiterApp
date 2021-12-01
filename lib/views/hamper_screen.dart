import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/session_model.dart';

class Hamper extends StatefulWidget {
  SessionModel sessionModel;

  var deger;

  Hamper(this.sessionModel, this.deger);

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
    setState(() {
      widget.deger = 10;
    });

    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, widget.deger);
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        elevation: 0.0,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10.0),
              child: Text(
                "Sepet",
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

  buildView(BuildContext context) {}
}
