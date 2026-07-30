import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterScreen extends StatefulWidget {
  final int count;
  const CounterScreen({super.key, required this.count});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late int localCount;
  @override
  void initState() {
    super.initState();
    localCount = widget.count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                 localCount++;
                });
              },
              child: Text('tap the counter'),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()=> context.pop(localCount), child: Text('DONE'))
          ],
        ),
      ),
    );
  }
}
