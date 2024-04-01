import 'package:flutter/material.dart';
import 'package:flutter_note/screens/create_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Notes"),
    ),

    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateNote()));
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}