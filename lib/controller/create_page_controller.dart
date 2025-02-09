import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/notes_model.dart';

class CreatePageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController(text: '');
  final notesController = TextEditingController(text: '');
  final dropdownController = TextEditingController(text: 'Low');
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
  final db = FirebaseFirestore.instance;

  void updateDropdownValue(String value) {
    dropdownController.text = value;
  }

  Future<void> createData() async {
    try {
      NotesModel note = NotesModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: titleController.text,
          note: notesController.text,
          priority: dropdownController.text);
      await notesCollection.add(note.toMap()).whenComplete(
        () {
          titleController.clear();
          notesController.clear();
          dropdownController.clear();
        },
      ).then(
        (value) => Get.back(),
      );
      
    } catch (errorMessage) {
      throw Exception("Error: $errorMessage");
    }
  }
}
