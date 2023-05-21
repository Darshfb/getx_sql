import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/view/screens/edit_screen.dart';
import 'package:getx_sqflite/view/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final SQLController control = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("todo App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => EditScreen(), transition: Transition.downToUp);
        },

      child: const Icon(Icons.add)),
      body: GetBuilder<SQLController>(
          builder: (controller) => ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) =>
                    TodoItem(controller: controller, index: index),
              )),
    );
  }
}
