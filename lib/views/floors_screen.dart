import 'package:flutter/material.dart';
import 'package:waiter_app_demo/widgets/floor_card.dart';

class FloorsScreen extends StatefulWidget {
  @override
  State<FloorsScreen> createState() => _FloorsScreenState();
}

class _FloorsScreenState extends State<FloorsScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: (MediaQuery.of(context).size.height),
          height: (MediaQuery.of(context).size.height)*0.10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(65),
              topLeft: Radius.circular(65),
            ),
          ),
          child: Center(
            child: Text(
              "KATLAR",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(143, 158, 191, 1),
              ),
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: (MediaQuery.of(context).size.height),
            height: (MediaQuery.of(context).size.height)*0.69,
            child: ListView(
              children: [
                FloorCard("1.Kat"),
                FloorCard("1.Kat"),
                FloorCard("1.Kat"),
              ],
            )
          ),
      ],
    );
  }

}