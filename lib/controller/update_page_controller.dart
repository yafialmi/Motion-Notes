import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/notes_model.dart';

class UpdatePageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController(text: '');
  final notesController = TextEditingController(text: '');
  final dropdownController = TextEditingController(text: 'Low');
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
  final db = FirebaseFirestore.instance;
  String? idData;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    idData = args['id'] ?? '';
    titleController.text = args['title'] ?? '';
    notesController.text = args['note'] ?? '';
    dropdownController.text = args['priority'] ?? '';
  }

  void updateDropdownValue(String value) {
    dropdownController.text = value;
  }

  Future<void> updateData(String docId) async {
    try {
      NotesModel note = NotesModel(
          id: idData!,
          title: titleController.text,
          note: notesController.text,
          priority: dropdownController.text);
      await notesCollection.doc(docId).update(note.toMap()).whenComplete(
        () {
          titleController.clear();
          notesController.clear();
          dropdownController.clear();
        },
      ).then(
        (value) {
          Get.offNamed('/home_page');
        },
      );
    } catch (errorMessage) {
      throw Exception("Error: $errorMessage");
    }
  }
}
