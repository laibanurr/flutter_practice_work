import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatefulWidget {
  final String notesText;

  const DetailsScreen({super.key, required this.notesText});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late String notesText;

  @override
  void initState() {
    super.initState();
    notesText = widget.notesText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () => context.pop(notesText), icon: Icon(Icons.arrow_back), color: Colors.white,),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  notesText,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final edited = await context.push<String>('/editingScreen', extra: notesText);
                if (edited != null) {
                  setState(() {
                    notesText = edited;
                  });
                }
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
