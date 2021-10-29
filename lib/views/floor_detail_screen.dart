import 'package:flutter/material.dart';
import 'package:waiter_app_demo/widgets/floor_detail_card.dart';

class FloorDetailScreen extends StatefulWidget {
  var floorName;

  FloorDetailScreen(this.floorName);

  @override
  State<FloorDetailScreen> createState() => _FloorDetailScreenState();
}

class _FloorDetailScreenState extends State<FloorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildContainer(context),
    );
  }

  Widget buildContainer(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 20.0, bottom: 20.0),
          child: Text(
            widget.floorName,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(143, 158, 191, 1),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: (MediaQuery.of(context).size.height),
            height: (MediaQuery.of(context).size.height),
            color: Colors.white,
            child: ListView(
              children: [
                FloorDetailCard("1.masa"),
                FloorDetailCard("1.masa"),
                FloorDetailCard("1.masa"),
                FloorDetailCard("1.masa"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Color.fromRGBO(143, 148, 251, 1),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: InkWell(
        child: Icon(Icons.arrow_back),
        onTap: (){
          Navigator.pop(context);
        },
      ),
    );
  }

}
