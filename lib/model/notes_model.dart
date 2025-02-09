import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class NotesModel {
  String id;
  String title;
  String note;
  String priority;

  NotesModel({
    required this.id,
    required this.title,
    required this.note,
    required this.priority,
  });

  factory NotesModel.fromJson(String str) =>
      NotesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotesModel.fromMap(Map<String, dynamic> json) => NotesModel(
        id: json["id"],
        title: json["title"],
        note: json["note"],
        priority: json["priority"],
      );

  factory NotesModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return NotesModel(
      id: doc.id,
      title: data['title'] ?? '',
      note: data['note'] ?? '',
      priority: data['priority'] ?? '',
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "note": note,
        "priority": priority,
      };
}
