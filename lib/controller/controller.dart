import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  void createDatabase() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    openAppDatabase(path: path);
  }

  void deleteTheDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');
    await deleteDatabase(path);
    print("deleted");
  }

  void openAppDatabase({required String path}) async {
    // open the database
    await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
          // todo => is our table name / primary key increment auto
      await db.execute('CREATE TABLE todo (id INTEGER PRIMARY KEY, '
          'title TEXT, description TEXT,time Text, favorite INTEGER,'
          ' completed INTEGER)');
      debugPrint("database is Created");
    }, onOpen: (Database database) {
      debugPrint("database is opened");
    });
  }

  void getAllData() {}

  void insertData() {}

  void updateData() {}

  void deleteData() {}
}
