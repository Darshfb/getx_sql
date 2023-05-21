import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sqflite/controller/controller.dart';
import 'package:getx_sqflite/shared/custom_text_form_field.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key, this.id, this.title, this.desc, this.time}) : super(key: key);
  final int? id;
  final String? title;
  final String? desc;
  final String? time;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final titleController = TextEditingController();

  final timeController = TextEditingController();

  final desController = TextEditingController();

  final SQLController controller = Get.find();

  @override
  void initState() {
  if(controller.updateTaskData){
    titleController.text = widget.title.toString();
    timeController.text = widget.time.toString();
    desController.text = widget.desc.toString();
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.updateTaskData ? "update Data" : "add Data"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomFormField(
              validationText: "The title must have a value",
              controller: titleController),
          CustomFormField(
              validationText: "The title must have a value",
              controller: desController),
          CustomFormField(
              validationText: "The title must have a value",
              controller: timeController),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              onPressed: () {
                if (!controller.updateTaskData) {
                  controller.insertData(
                      title: titleController.text,
                      description: desController.text,
                      time: timeController.text);
                } else {
                  controller.updateData(
                    title: titleController.text,
                    description: desController.text,
                    time: timeController.text,
                    id: widget.id!,
                  );
                }
              },
              textColor: Colors.white,
              color: Colors.red,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child:
                  Text(controller.updateTaskData ? "update Data" : "add Data"),
            ),
          )
        ],
      ),
    );
  }
}
