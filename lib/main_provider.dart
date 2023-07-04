import 'package:flutter/material.dart';
import 'package:forlearinghive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainProvider extends ChangeNotifier {
  var box = Hive.box<List<NoteModel>>("noteBox");
  late NoteModel selectednote;
  late int selectedIndex;

  void addData(NoteModel note) {
    List<NoteModel> user = box.get(0)!;
    box.delete(0);
    user.add(note);
    box.put(0, user);
    loadAll();
  }

  void updateData(NoteModel note) {
    List<NoteModel> user = box.get(0)!;
    box.delete(0);
    user[selectedIndex]=note;
    box.put(0, user);
    loadAll();
  }

  @override
  notifyListeners();

  List<NoteModel> loadAll() {
    List<NoteModel> user = box.get(0)!;
    return user;
  }
}
