import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waiter_app_demo/models/session_model.dart';

class DbHelper{
  var _db;
  Future<Database> get db async {
    if (_db == null) {
      _db= await initializeDb();
    }
    return _db;
  }

  Future<Database> initializeDb() async{
    String dbPath=join(await getDatabasesPath(),"waiterdemo.db");
    var waiterdemoDb=await openDatabase(dbPath,version: 1,onCreate: createDb);
    return waiterdemoDb;
  }

  void createDb(Database db, int version) {
    db.execute("Create table IF NOT EXISTS session(id integer primary key, accessToken text, refreshToken text)");
  }

  Future<List<SessionModel>> getUser() async{
    Database db =await this.db;
    var result=await db.query("session");
    return List.generate(result.length,(i){
      return SessionModel.fromJson(result[i]);
    });
  }

  Future<int> insert(SessionModel sessionModel) async{
    var map={
      "accessToken":sessionModel.accessToken,
      "refreshToken":sessionModel.refreshToken,
    };
    Database db=await this.db;
    var result= await db.insert("session", map);
    return result;
  }

  Future<int> delete(String accessToken) async{
    Database db=await this.db;
    var result= await db.rawDelete("delete from session where accessToken='$accessToken'");
    return result;
  }

}