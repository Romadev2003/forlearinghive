import 'package:flutter/material.dart';
import 'package:forlearinghive/models/note_model.dart';

class AddPage extends StatefulWidget {
  const AddPage(List<NoteModel> notes, {Key? key}) : super(key: key);
    @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note"),
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
