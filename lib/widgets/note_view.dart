import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    Key? key,
    required this.note_title,
    required this.note_description, required this.onNewDeleted, required this.index,
  }) : super(key: key);

  final String note_title;
  final String note_description;
  final int index;

  final Function (int) onNewDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  var note;
                  return AlertDialog(
                    title: const Text("Delete This?"),
                    content: Text("Note ${note.title} will be deleted"),

                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).pop();
                        onNewDeleted(index);
                      },
                       child: const Text("DELETE"),
                       ),
                       TextButton(onPressed: (){
                        Navigator.of(context).pop();
                       },
                        child: const Text("CANCEL"),
                        ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note_title,
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              note_description,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
