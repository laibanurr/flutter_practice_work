import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotesEditScreen extends StatefulWidget {
 final  String notesText;
  const NotesEditScreen({super.key, required this.notesText});

  @override
  State<NotesEditScreen> createState() => _NotesEditScreenState();
}

class _NotesEditScreenState extends State<NotesEditScreen> {
  TextEditingController editedTitle = TextEditingController();
  @override
  void initState() {
    super.initState();
    editedTitle.text = widget.notesText;
  }
  @override
  void dispose() {
    editedTitle.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              child: Center(child: TextField(controller: editedTitle)),
            ),
            ElevatedButton(onPressed: () => context.pop(
           editedTitle.text), child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
