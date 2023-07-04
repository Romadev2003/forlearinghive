import 'package:flutter/material.dart';
import 'package:forlearinghive/main_provider.dart';
import 'package:forlearinghive/models/note_model.dart';
import 'package:forlearinghive/screens/add_page.dart';
import 'package:forlearinghive/screens/info_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   @override
  Widget build(BuildContext context) {
    List<NoteModel>? notes = Provider.of<MainProvider>(context, listen: true).loadAll();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Note Pade"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (_)=>AddPage()), (route) => false);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child:  notes.isEmpty
            ? const Center(child: Text("No notes available"))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Provider.of<MainProvider>(context, listen: false).selectedIndex=index;
                      Provider.of<MainProvider>(context, listen: false).selectednote=notes[index];
                      Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (_)=>InfoPage()), (route) => false);

                    },
                    child: Container(
                      margin: const EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: Color(0xff1B1B1B),
                             // borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(notes[index].title),
                            ),
                          ),
                          const Divider(thickness: 1,color: Colors.white70,endIndent: 6,),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(0),
                              decoration: const BoxDecoration(
                                color: Color(0xff1B1B1B),
                               // borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                notes[index].dis,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }


}
