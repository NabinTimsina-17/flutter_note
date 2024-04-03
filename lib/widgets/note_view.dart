import 'package:flutter/material.dart';

import '../data/note_data.dart';

class NoteView extends StatelessWidget {
  const NoteView({
    Key? key,
    required this.index,
    required this.onDelete,
  }) : super(key: key);

  final int index;
  final VoidCallback onDelete;

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
                  return AlertDialog(
                    title: const Text("Delete note?"),
                    content: Text("Delete note with ${notes[index].title}?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          // Remove item from the list
                          onDelete();

                          // Navigate back
                          Navigator.pop(context);
                           Navigator.pop(context);
                        },
                        child: const Text("DELETE"),
                      ),
                      TextButton(
                        onPressed: () {
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notes[index].title,
              style: const TextStyle(
                fontSize: 26,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              notes[index].body,
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
