import 'package:flutter/material.dart';
import 'package:forlearinghive/core/have_halper.dart';
import 'package:forlearinghive/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';




class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemCount = 0;

  // Declare itemCount as a member variable
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Note Pade"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            List<NoteModel> notesList = [
              NoteModel("Jamolov Ramazon", "dis", DateTime.now(), false),
              NoteModel("Jamolov Ramazon", "BU ikki", DateTime.now(), false),
            ];
            HaveHalper().addListToHive(notesList);
          });
          print(HaveHalper().getList()[0].title);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            childAspectRatio: 1, // Adjust as needed
          ),
          children: List.generate(itemCount, (index) {
            return Container(
              // Desired height of the grid item
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Center(
                      child: Text("Jamolov Ramazon "),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xff8bef10),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "dtsrhafduaysgsia saidyfiujsghditr yejrorygujfoev 8yeuoryufovy;ogteryrteyrt ggfdddh tyhelkgkusygrhe  gynweoiuurfowie iu   eyiweuyroiweyroiueyrroiuweyoiuyweoriuw",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(

                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }


}
