import 'dart:ffi';

import 'package:hive_flutter/adapters.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel{
  @HiveField(0)
  String title;
  @HiveField(1)
  String dis;
  @HiveField(2)
  DateTime time;
  @HiveField(3)
  bool isLike;

  NoteModel(this.title, this.dis, this.time, this.isLike);
}