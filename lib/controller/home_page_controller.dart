import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo_app/colors/color.dart';
import 'package:todo_app/model/notes_model.dart';

class HomePageController extends GetxController {
  final optionValue = 0.obs;
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');
  final Query notesQueryPriority = FirebaseFirestore.instance
      .collection("notes")
      .orderBy("priority", descending: false);
  final Query notesQueryLastest = FirebaseFirestore.instance
      .collection("notes")
      .orderBy("id", descending: false);
  final Query notesQueryNewest = FirebaseFirestore.instance
      .collection("notes")
      .orderBy("id", descending: true);

  RxList<NotesModel> notesList = <NotesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    optionFetch();
  }

  Future fetchNotesByPriority() async {
    notesQueryPriority.snapshots().listen((snapshot) {
      notesList.value =
          snapshot.docs.map((doc) => NotesModel.fromFirestore(doc)).toList();
    });
  }

  Future fetchNotesByLastest() async {
    notesQueryLastest.snapshots().listen((snapshot) {
      notesList.value =
          snapshot.docs.map((doc) => NotesModel.fromFirestore(doc)).toList();
    });
  }

  Future fetchNotesByOldest() async {
    notesQueryNewest.snapshots().listen((snapshot) {
      notesList.value =
          snapshot.docs.map((doc) => NotesModel.fromFirestore(doc)).toList();
    });
  }

  Future fetchNotes() async {
    notesCollection.snapshots().listen((snapshot) {
      notesList.value =
          snapshot.docs.map((doc) => NotesModel.fromFirestore(doc)).toList();
    });
  }

  Future<void> deleteNote(String docId) async {
    try {
      await notesCollection.doc(docId).delete();
    } catch (error) {
      Get.snackbar("Error", "Failed to delete note: $error",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.danger,
          colorText: AppColor.textWhite);
    }
  }

  Future optionFetch() async {
    switch (optionValue.value) {
      case 1:
        await fetchNotesByPriority();
        break;
      case 2:
        await fetchNotesByLastest();
        break;
      case 3:
        await fetchNotesByOldest();
        break;
      default:
        await fetchNotes();
        break;
    }
    refresh();
  }
}
