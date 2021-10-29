import 'package:flutter/material.dart';

class FloorDetailCard extends StatefulWidget{
  var floorName;

  FloorDetailCard(this.floorName);

  @override
  _FloorDetailCardState createState() => _FloorDetailCardState();
}
class _FloorDetailCardState extends State<FloorDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        height: (MediaQuery.of(context).size.height) * 0.10,
        width: (MediaQuery.of(context).size.width) * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
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
        child: Row(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) * 0.50,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  widget.floorName,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(143, 158, 191, 1),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: (MediaQuery.of(context).size.width) * 0.40,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.print),
                    color: Color.fromRGBO(143, 148, 251, 1),
                    onPressed: () {
                      debugPrint("Butona tıklandı");
                    },
                    iconSize: 24,
                  ),
                  IconButton(
                    icon: Icon(Icons.leak_remove_rounded),
                    color: Color.fromRGBO(143, 148, 251, 1),
                    onPressed: () {
                      debugPrint("Butona tıklandı");
                    },
                    iconSize: 24,
                  ),
                  IconButton(
                    icon: Icon(Icons.play_arrow_sharp),
                    color: Color.fromRGBO(143, 148, 251, 1),
                    onPressed: () {
                      debugPrint("Butona tıklandı");
                    },
                    iconSize: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}