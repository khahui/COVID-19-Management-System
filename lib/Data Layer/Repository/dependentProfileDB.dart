import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../Model/UserDependentProfileModel.dart';

class DependentProfileDB {
  DependentProfileDB._privateContructor();

  static final DependentProfileDB instance =
      DependentProfileDB._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.dependentProfileDB');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database dependentProfileDB, int version) async {
    await dependentProfileDB.execute(' '
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER) '
        ' ');

    await dependentProfileDB.execute(' '
        ' CREATE TABLE Admin(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER) '
        ' ');
  }

  //add User data
  Future<int> addUser(UserModel userModel) async {
    Database dependentProfileDB = await instance.database;
    return await dependentProfileDB.insert('User', userModel.toJson());
  }

  // //add Admin data
  // Future<int> addAdmin(AdminModel adminModel) async
  // {
  //   Database db = await instance.database;
  //   return await db.insert('Admin',adminModel.toJson());
  // }

  //get all User data
  Future<List<UserModel>> getAllUserData() async {
    Database dependentProfileDB = await instance.database;
    final userModel = await dependentProfileDB.query('User', orderBy: 'name');
    return userModel.map((json) => UserModel.fromJson(json)).toList();
  }

  // //get all Admin data
  // Future<List<AdminModel>> getAllAdminData() async {
  //   Database db = await instance.database;
  //   final adminModel = await db.query('Admin', orderBy: 'name');
  //   return adminModel.map((json) => AdminModel.fromJson(json)).toList();
  // }

  //get specific user data
  Future<UserModel> getSpecificUserData(int id) async {
    Database dependentProfileDB = await instance.database;
    final userData = await dependentProfileDB.query('User',
        columns: ['id', 'name', 'age'], where: 'id = ?', whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  //update User Data
  Future<int> updateUser(UserModel userModel) async {
    Database dependentProfileDB = await instance.database;

    return dependentProfileDB.update(
      'User',
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database dependentProfileDB = await instance.database;

    return dependentProfileDB.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
