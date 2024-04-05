import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/note_data.dart';
import '../models/note_model.dart';
import '../widgets/create_note.dart';
import '../widgets/note_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? localUser='';

  void getLocalUser()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    localUser =  prefs.getString('username');


  }

  

  @override
  void initState() {
    super.initState();

    getLocalUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(localUser!),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteView(
                    index: index,
                    onDelete: () {
                      setState(() {
                        // Remove the note from the list
                        notes.removeAt(index);
                      });
                    },
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notes.isEmpty ? 'add a note' : notes[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      notes.isEmpty ? 'add a note' : notes[index].body,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(
              height: 10,
            ),
             Text(
              user,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CreateNote(
                onNewNoteCreated: onNewNoteCreated,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void onNewNoteCreated(Note note) {
    setState(() {
      notes.add(note);
    });
  }
}