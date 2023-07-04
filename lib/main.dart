import 'package:flutter/material.dart';
import 'package:forlearinghive/models/note_model.dart';
import 'package:forlearinghive/screens/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'main_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  var box= await Hive.openBox<List<NoteModel>>('noteBox');
  box.put(0, []);
  runApp(
      ChangeNotifierProvider.value(
          value: MainProvider(),
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'learing for hive',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
