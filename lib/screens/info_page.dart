import 'package:flutter/material.dart';
import 'package:forlearinghive/main_provider.dart';
import 'package:forlearinghive/models/note_model.dart';
import 'package:forlearinghive/screens/home_page.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  const InfoPage( {Key? key}) : super(key: key);
  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late TextEditingController titleController;
  late TextEditingController disController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    disController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    disController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NoteModel note=Provider.of<MainProvider>(context, listen: false).selectednote;
    disController.text=note.dis;
    titleController.text=note.title;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff1B1B1B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextField(
                  controller: titleController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const Divider(thickness: 1,color: Colors.white,),
            Expanded(
              flex: 10,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xff1B1B1B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: disController,
                  maxLines: 15,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 56,),
            ElevatedButton(
              onPressed: () {
                Provider.of<MainProvider>(context, listen: false).updateData(NoteModel(titleController.text, disController.text, DateTime.now(), false));
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const HomePage()), (route) => false);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 54,
                child: const Text("save"),
              ),
            ),
            const SizedBox(height: 24,),
          ],
        ),
      ),
    );
  }
}
