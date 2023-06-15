import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/AdminLoginModel.dart';
import '../Model/MOHStaffLoginModel.dart';
import '../Model/UserLoginModel.dart';

class LoginDB {
  LoginDB._privateContructor();

  static final LoginDB instance = LoginDB._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database db, int version) async {
    await db.execute(' '
        ' CREATE TABLE UserLogin(id INTEGER PRIMARY KEY,password TEXT) '
        ' ');

    await db.execute(' '
        ' CREATE TABLE AdminLogin(id INTEGER PRIMARY KEY,password TEXT) '
        ' ');

      await db.execute(' '
      ' CREATE TABLE MOHStaffLogin(id INTEGER PRIMARY KEY,password TEXT) '
      ' ');
  }

  //Login User
  Future<int> loginUser(UserLoginModel userLoginModel) async {
    Database db = await instance.database;
    return await db.insert('UserLogin', userLoginModel.toJson());
  }

  //Login Admin
  Future<int> loginAdmin(AdminLoginModel adminLoginModel) async {
    Database db = await instance.database;
    return await db.insert('AdminLogin', adminLoginModel.toJson());
  }

  //Login MOHStaff
  Future<int> loginMOHStaff(MOHStaffLoginModel mohStaffLoginModel) async {
    Database db = await instance.database;
    return await db.insert('MOHSTaffLogin', mohStaffLoginModel.toJson());
  }
}
