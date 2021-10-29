import 'package:flutter/material.dart';
import 'package:waiter_app_demo/views/floor_detail_screen.dart';

class FloorCard extends StatefulWidget{
  var floorName;

  FloorCard(this.floorName);

  @override
  _FloorCardState createState() => _FloorCardState();
}
class _FloorCardState extends State<FloorCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>FloorDetailScreen("1.Kat")));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10.0),
        child:Container(
          height: (MediaQuery.of(context).size.height)*0.10,
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
          child: Center(
            child: Text(
              widget.floorName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(143, 158, 191, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}