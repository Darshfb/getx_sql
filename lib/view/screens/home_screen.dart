import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(SQLController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("todo App"),
        actions: [
          IconButton(
              onPressed: () {
                controller.deleteTheDatabase();
              },
              icon: const Icon(Icons.remove)),
          IconButton(
              onPressed: () {
                controller.insertData();
              },
              icon: const Icon(Icons.add)),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          IconButton(onPressed: () {
            controller.updateData();
          }, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {
            controller.deleteData();
          }, icon: const Icon(Icons.delete_forever)),
        ],
      ),
    );
  }
}
