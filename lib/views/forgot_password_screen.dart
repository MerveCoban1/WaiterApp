import 'package:flutter/material.dart';
import 'package:waiter_app_demo/views/login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  final GlobalKey<ScaffoldState> key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        body: Padding(
            padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height)*0.30,left: (MediaQuery.of(context).size.width)*0.10,right: (MediaQuery.of(context).size.width)*0.10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: (MediaQuery.of(context).size.height)*0.01,),
                Container(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: (MediaQuery.of(context).size.height)*0.02,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ]
                      )
                  ),
                  child: Center(
                    child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                        },
                        child: Text("Şifre Sıfırlama Maili Gönder", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                    ),
                  ),
                ),
                SizedBox(height: (MediaQuery.of(context).size.height)*0.02,),
                InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: Text("Giriş Yap", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1),fontWeight: FontWeight.bold),textAlign: TextAlign.right,)
                ),
              ],
            )));
  }

  void login() async{
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
  }
}