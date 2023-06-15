import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/AdminVaccinationModel.dart';
import '../Model/MOHStaffVaccinationModel.dart';
import '../Model/UserVaccinationModel.dart';

class VaccinationDB {
  VaccinationDB._privateContructor();

  static final VaccinationDB instance = VaccinationDB._privateContructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    //directory ==> provide support for directory
    //getApplicationDocumentsDirectory() --> support document directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, 'Database.vaccinationDB');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  //create database
  Future _onCreate(Database vaccinationDB, int version) async {
    await vaccinationDB.execute(' '
        ' CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, icpn TEXT, age INTEGER, gender TEXT, address TEXT, postcode INTEGER, state TEXT) '
        ' ');

    await vaccinationDB.execute(' '
        ' CREATE TABLE Admin(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age INTEGER) '
        ' ');
  }

  //add User vaccination data
  Future<int> addUser(UserVaccinationModel uservaccinationModel) async {
    Database vaccinationDB = await instance.database;
    return await vaccinationDB.insert('User', uservaccinationModel.toJson());
  }

  //add Admin data
  Future<int> addAdmin(AdminVaccinationModel adminvaccinationModel) async {
    Database vaccinationDB = await instance.database;
    return await vaccinationDB.insert('Admin', adminvaccinationModel.toJson());
  }

  //add MOH staff data
  Future<int> addMOHStaff(
      MOHStaffVaccinationModel mohstaffvaccinationModel) async {
    Database vaccinationDB = await instance.database;
    return await vaccinationDB.insert('MOH Staff', mohstaffvaccinationModel.toJson());
  }

  //get all User data
  Future<List<UserVaccinationModel>> getAllUserData() async {
    Database vaccinationDB = await instance.database;
    final uservaccinationModel = await vaccinationDB.query('User', orderBy: 'state');
    return uservaccinationModel
        .map((json) => UserVaccinationModel.fromJson(json))
        .toList();
  }

  //get all Admin data
  Future<List<AdminVaccinationModel>> getAllAdminData() async {
    Database vaccinationDB = await instance.database;
    final adminvaccinationModel = await vaccinationDB.query('Admin', orderBy: 'name');
    return adminvaccinationModel
        .map((json) => AdminVaccinationModel.fromJson(json))
        .toList();
  }

  //get all MOH Staff data
  Future<List<MOHStaffVaccinationModel>> getAllMOHStaffData() async {
    Database vaccinationDB = await instance.database;
    final mohstaffvaccinationModel = await vaccinationDB.query('MOH Staff');
    return mohstaffvaccinationModel
        .map((json) => MOHStaffVaccinationModel.fromJson(json))
        .toList();
  }

  //get specific user data
  Future<UserVaccinationModel> getSpecificUserData(int id) async {
    Database vaccinationDB = await instance.database;
    final userData = await vaccinationDB.query('User',
        columns: [
          'id',
          'name',
          'icpn',
          'age',
          'gender',
          'address',
          'postcode',
          'state'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (userData.isNotEmpty) {
      return UserVaccinationModel.fromJson(userData.first);
    }

    throw Exception('ID not found');
  }

  //get specific admin data
  Future<AdminVaccinationModel> getSpecificAdminData(int id) async {
    Database vaccinationDB = await instance.database;
    final adminData = await vaccinationDB.query('Admin',
        columns: ['', 'place', 'date', 'time'],
        where: 'id = ?',
        whereArgs: [id]);

    if (adminData.isNotEmpty) {
      return AdminVaccinationModel.fromJson(adminData.first);
    }

    throw Exception('ID not found');
  }

  //get specific MOH Staff data
  Future<MOHStaffVaccinationModel> getSpecificMOHStaffData(int id) async {
    Database vaccinationDB = await instance.database;
    final mohstaffData = await vaccinationDB.query('MOH Staff',
        columns: [
          '',
          'date',
          'time',
          'manufacturer',
          'vaccineNum',
          'batchNum',
          'expiryDate'
        ],
        where: 'id = ?',
        whereArgs: [id]);

    if (mohstaffData.isNotEmpty) {
      return MOHStaffVaccinationModel.fromJson(mohstaffData.first);
    }

    throw Exception('ID not found');
  }

  //update User Data
  Future<int> updateUser(UserVaccinationModel userModel) async {
    Database vaccinationDB = await instance.database;

    return vaccinationDB.update(
      'User',
      userModel.toJson(),
      where: 'id = ?',
      whereArgs: [userModel.id],
    );
  }

  //update Admin Data
  Future<int> updateAdmin(AdminVaccinationModel adminvaccinationModel) async {
    Database vaccinationDB = await instance.database;

    return vaccinationDB.update(
      'Admin',
      adminvaccinationModel.toJson(),
      where: 'id = ?',
      whereArgs: [adminvaccinationModel.id],
    );
  }

  //update MOHStaff Data
  Future<int> updateMOHStaff(
      MOHStaffVaccinationModel mohstaffvaccinationModel) async {
    Database vaccinationDB = await instance.database;

    return vaccinationDB.update(
      'MOH Staff',
      mohstaffvaccinationModel.toJson(),
      where: 'id = ?',
      whereArgs: [mohstaffvaccinationModel.id],
    );
  }

  //delete User Data
  Future<int> deleteUser(int id) async {
    Database vaccinationDB = await instance.database;

    return vaccinationDB.delete(
      'User',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete Admin Data
  Future<int> deleteAdmin(int id) async {
    Database vaccinationDB = await instance.database;

    return vaccinationDB.delete(
      'Admin',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete MOH Staff Data
  Future<int> deleteMOHStaff(int id) async {
    Database vaccinationDB = await instance.database;

    return vaccinationDB.delete(
      'MOH Staff',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
