import 'package:flutter/material.dart';
import 'package:waiter_app_demo/models/session.dart';
import 'package:waiter_app_demo/services/auth_service.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Session session;
  AuthService apiManager=AuthService();
  final GlobalKey<ScaffoldState> key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:key,
        backgroundColor: Colors.white,
        body: buildSingleChildScrollView(context)
    );
  }

  SingleChildScrollView buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height)*0.55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.fill
                    )
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: (MediaQuery.of(context).size.height)*0.05,
                      width: (MediaQuery.of(context).size.width)*0.20,
                      height: (MediaQuery.of(context).size.height)*0.30,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-1.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width)*0.30,
                      width: (MediaQuery.of(context).size.width)*0.20,
                      height: (MediaQuery.of(context).size.height)*0.20,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/light-2.png')
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 60),
                        child: Center(
                          child: Text("Digigarson", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0,left: 35.0,right: 35.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10)
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey))
                            ),
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Kullanıcı Adı",
                                  hintStyle: TextStyle(color: Colors.grey[400])
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: true,
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Şifre",
                                  hintStyle: TextStyle(color: Colors.grey[400])
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
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
                            login();
                          },
                          child: Text("Giriş Yap", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                    SizedBox(height: (MediaQuery.of(context).size.height)*0.03),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                      },
                      child: Text("Şifremi Unuttum?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }

  void login() async{
    session=await apiManager.loginUser(nameController.text.toString(), passwordController.text.toString());
    if(session.accessToken=="Hata"){
      key.currentState!.showSnackBar(SnackBar(content: Text("${session.refreshToken.toString()}")));
    }else{
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen(session)));
    }
  }
}
