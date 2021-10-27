import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();

  final GlobalKey<ScaffoldState> key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        body: Text("Anasayfa"),
    );
  }


}