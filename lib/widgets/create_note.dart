import 'package:flutter/material.dart';
import 'package:flutter_note/data/note_data.dart';
import 'package:flutter_note/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNewNoteCreated});

  final Function(Note) onNewNoteCreated;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {

TextEditingController titleController =  TextEditingController();
  TextEditingController bodyControlller = TextEditingController();
  TextEditingController userControlller = TextEditingController();

  void setLocalUser(String user)async{
 final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', user);

         

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
               style: const TextStyle(
                fontSize: 28
               ),
               decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
               ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: bodyControlller,
              style: const TextStyle(
                fontSize: 21
               ),
               decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your Story"
               ),
            ),

              TextFormField(
              controller: userControlller,
              style: const TextStyle(
                fontSize: 21
               ),
               decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Your user name"
               ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
       
        final note = Note(
           body: bodyControlller.text,
          title: titleController.text,
        
         );
         user = userControlller.text;
        setLocalUser(user);
         widget.onNewNoteCreated(note);
         Navigator.of(context).pop();
      },

      child: const Icon(Icons.save),
      ) ,
    );
  }
}