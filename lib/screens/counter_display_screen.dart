import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterDisplayScreen extends StatefulWidget {
  const CounterDisplayScreen({super.key});

  @override
  State<CounterDisplayScreen> createState() => _CounterDisplayScreenState();
}

class _CounterDisplayScreenState extends State<CounterDisplayScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 10),
              ),
              child: Center(
                child: Text(
                  'count is $count',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final result = await context.push<int>(
                  '/counterScreen',
                  extra: count,
                );
                if (result != null) {
                  setState(() {
                  count = result;
                  });
                }
              },
              child: Text('TAP'),
            ),
          ],
        ),
      ),
    );
  }
}
