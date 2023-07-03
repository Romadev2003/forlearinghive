import 'package:forlearinghive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HaveHalper {
  Box box = HaveHalper().openHiveBox();
  openHiveBox() async{
    Box box = await Hive.openBox<List<NoteModel>>('noteBox');
    return box;
  }
  addListToHive(List<NoteModel> notesList ){
    box.put('notes',notesList);
  }
  getList(){
  return   box.get('noteBox');
  }
}