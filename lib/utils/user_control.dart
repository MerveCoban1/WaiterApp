import 'package:shared_preferences/shared_preferences.dart';

class UserControl{
  late SharedPreferences pref;

  userControl() async {
    pref=await SharedPreferences.getInstance();
    var email=pref.getString("email");
    if(email==""){
      return false;
    }else{
      return true;
    }
  }
}