import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLController extends GetxController {
  @override
  void onInit() {
    createDatabase();
    super.onInit();
  }

  late Database database;

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
    }, onOpen: (Database db) {
      database = db;
      getAllData();
      debugPrint("database is opened");
    });
  }

  List<TodoModel> list = [];

  void getAllData() async {
    list = [];
    var allData = await database.query("todo");
    for (var i in allData) {
      list.add(TodoModel.fromJson(i));
    }
    update();
  }

  void insertData({
    required String title,
    required String description,
    required String time,
  }) async {
    try {
      var insert = await database.insert("todo", {
        "title": title,
        "description": description,
        "time": time,
        "favorite": 0,
        "completed": 0,
      });
      Get.back();
      debugPrint("$insert data inserted");
      getAllData();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  bool updateTaskData = false;

  void updateData({
    required String title,
    required String description,
    required String time,
    required int id,
  }) async {
    try{
      var updateData = await database.update(
        "todo",
        {
          "title": title,
          "description": description,
          "time": time,
          "favorite": 1,
          "completed": 1,
        },
        where: "id = $id",
      );
      debugPrint("Updated item $updateData");
      getAllData();
      Get.back();
    }catch (e){
      debugPrint(e.toString());
    }
  }

  void deleteData({required int id}) async {
    var deletedItem = await database.delete("todo", where: "id = $id");
    debugPrint("deleted item $deletedItem");
    getAllData();
  }
}
