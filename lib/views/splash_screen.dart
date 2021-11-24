import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waiter_app_demo/views/login_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
            () =>
                Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      body: Center(
        child: Container(
          width: 130.0,
          height: 150.0,
          child: ListView(
              children: [
                Text("DigiGarson",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Image.asset('assets/images/clock.png')
              ],
            ),
        ),
      ),
    );
  }
}
