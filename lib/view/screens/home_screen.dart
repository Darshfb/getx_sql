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
          IconButton(onPressed: (){
            controller.deleteTheDatabase();
          }, icon: const Icon(Icons.remove))
        ],
        centerTitle: true,
      ),
    );
  }
}
