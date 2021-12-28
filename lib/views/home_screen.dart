import 'package:flutter/material.dart';
import 'package:waiter_app_demo/database/dbHelper.dart';
import 'package:waiter_app_demo/models/session_model.dart';
import 'package:waiter_app_demo/views/floors_screen.dart';
import 'package:waiter_app_demo/views/all_orders_screen.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  SessionModel sessionModel;
  HomeScreen(this.sessionModel);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _contents = [];
  int _activeContentNo = 0;
  var dbHelper=DbHelper();

  final GlobalKey<ScaffoldState> key=GlobalKey();

  @override
  void initState(){
    super.initState();
    _contents=[FloorsScreen(widget.sessionModel),AllOrdersScreen(widget.sessionModel)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      appBar: buildAppBar(context),
      body: _contents[_activeContentNo],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PreferredSize buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(70.0),
      child: AppBar(

        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: (){
                logout();
              }, 
              child: Icon(Icons.logout)
            ),
          ),
        ],
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 10.0),
              child: Text("Digi",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text("Garson",
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

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: _activeContentNo,
      selectedItemColor: Color.fromRGBO(143, 148, 251, 1),
      unselectedItemColor: Color.fromRGBO(143, 158, 191, 1),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Katlar"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.reorder),
          title: Text("Siparişler"),
        ),
      ],
      onTap: (int tiklananButonPozisyonNo) {
        setState(() {
          _activeContentNo = tiklananButonPozisyonNo;
        });
      },
    );
  }

  Future<void> logout() async {
    print("silme işlemi olcak şimdi");
    dbHelper.delete(widget.sessionModel.accessToken).then((value) => {
      print("silme işlemi"),
      print(value),
    });
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

}