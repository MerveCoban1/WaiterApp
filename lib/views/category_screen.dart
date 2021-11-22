import 'package:flutter/material.dart';

List<String> categoryList = [];

class Category extends StatefulWidget {
  @override
  State<Category> createState() => _Category();
}

class _Category extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return buildContainer(context);
  }

  Widget buildContainer(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Container(
        child: GridView.count(
          childAspectRatio: 4.0,
          crossAxisCount: 2,
          children: List.generate(
              categoryList.length != 0 ? categoryList.length : 37, (index) {
            return Container(
              height: 100,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: Text(
                    "Deneme",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                ),
                color: Colors.blue,
              ),
            );
          }),
        ),
      ),
    );
  }
}
