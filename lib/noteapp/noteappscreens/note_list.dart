import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoteList extends StatefulWidget {
 const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  List<String> notesList = [
    'life quotes ',
    'Grocery list',
    'Study plan',
    'Random thoughts',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'My Notes',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.white),
              title: Text(
                notesList[index],
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.favorite),
              onTap: () async {
                final updatedNotes = await context.push<String>(
                  '/detailedScreen',
                  extra: notesList[index],
                );
                if (updatedNotes != null) {
                  setState(() {
             notesList[index] = updatedNotes;

                  });
                }
              },
            );
          },
        ),
      ),
    );
  }
}
