import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/core/model/providers_quote.dart';

class QuoteOfTheDayScreen extends ConsumerStatefulWidget {
  const QuoteOfTheDayScreen({super.key});

  @override
  ConsumerState<QuoteOfTheDayScreen> createState() => _QuoteOfTheDayScreenState();
}

class _QuoteOfTheDayScreenState extends ConsumerState<QuoteOfTheDayScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final quoteAsync = ref.watch(quoteOfTheDayProvider(selectedDate));

    return Scaffold(
      appBar: AppBar(title: const Text('Quote of the Day')),
      body: Center(
        child: quoteAsync.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('$error'),
          data: (quote) => Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${selectedDate.month}/${selectedDate.day}/${selectedDate.year}'),
                const SizedBox(height: 12),
                Text("'${quote.text}'", style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('"${quote.author}"'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'prev',
            onPressed: () {
              setState(() => selectedDate = selectedDate.subtract(const Duration(days: 1)));
            },
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 12),
          FloatingActionButton(
            heroTag: 'next',
            onPressed: () {
              setState(() => selectedDate = selectedDate.add(const Duration(days: 1)));
            },
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }

}