import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note_title, required this.note_description});
  final String note_title;
  final String note_description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Note View"),
      ),

      body:  Padding(padding: EdgeInsets.all(10.0),
      child: 
      Column(
        children: [
         Text(
          note_title
        ),

        Text(
          note_description
        )
        ],
      ),
      ),
    );
  }
}