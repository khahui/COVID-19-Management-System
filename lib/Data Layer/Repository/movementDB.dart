import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/UserMovementModel.dart';

class MovementDB {
  MovementDB._privateContructor();

  static final MovementDB instance = MovementDB._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.movementDB');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database movementDB, int version) async {
    await movementDB.execute(' '
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER, location TEXT, area TEXT, bodyTemp INTEGER, date TEXT, time TEXT, mobileNum TEXT, vaccStatus TEXT, riskStatus TEXT) '
        ' ');

    await movementDB.execute(' '
        ' CREATE TABLE Admin(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER, location TEXT, area TEXT, bodyTemp INTEGER, date TEXT, time TEXT) '
        ' ');
  }

  //add User data
  Future<int> addUser(UserModel userModel) async {
    Database movementDB = await instance.database;
    return await movementDB.insert('User', userModel.toJson());
  }

  //get all User data
  Future<List<UserModel>> getAllUserData() async {
    Database db = await instance.database;
    final userModel = await db.query('User', orderBy: 'name');
    return userModel.map((json) => UserModel.fromJson(json)).toList();
  }

  //get specific user data
  Future<UserModel> getSpecificUserData(int id) async {
    Database movementDB = await instance.database;
    final userData = await movementDB.query('User',
        columns: [
          'id',
          'name',
          'age',
          'location',
          'area',
          'bodyTemp',
          'date',
          'time',
          'mobileNum',
          'vaccStatus',
          'riskStatus'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  //update User Data
  Future<int> updateUser(UserModel userModel) async {
    Database movementDB = await instance.database;

    return movementDB.update(
      'User',
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database movementDB = await instance.database;

    return movementDB.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
