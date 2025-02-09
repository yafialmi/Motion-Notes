import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/notes_model.dart';

class DetailPageController extends GetxController {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<NotesModel?> fetchNoteById(String docId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await notesCollection.doc(docId).get();
      if (documentSnapshot.exists) {
        return NotesModel.fromFirestore(documentSnapshot);
      } else {
        return null;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  void fetchSpecificNote(String docId) async {
    NotesModel? note = await fetchNoteById(docId);
    if (note != null) {
      Get.toNamed('/detail_page', arguments: {
        'id': note.id,
        'title': note.title,
        'note': note.note,
        'priority': note.priority
      });
    }
  }
  void fetchSpecificNoteToUpdate(String docId) async {
    NotesModel? note = await fetchNoteById(docId);
    if (note != null) {
      Get.toNamed('/update_page', arguments: {
        'id': note.id,
        'title': note.title,
        'note': note.note,
        'priority': note.priority
      });
    }
  }
}
