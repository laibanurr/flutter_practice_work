import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/core/model/providers_quote.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/feature/screen/fav_screen.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/feature/screen/quote_of_the_day_screen.dart';

class QuoteDisplayScreen extends ConsumerWidget {
  const QuoteDisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsync = ref.watch(quoteProvider);
    return Scaffold(
      body: Center(
        child: quoteAsync.when(
          loading: () => CircularProgressIndicator(color: Colors.amber),
          error: (error, StackTrace) => Text('$error'),
          data: (quotes) {
            return Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    " '${quotes.text}' ",
                    style: TextStyle(fontSize: 18, color: Colors.amberAccent),
                  ),
                  SizedBox(height: 18),
                  Text(
                    ' "${quotes.author}" ',
                    style: TextStyle(fontSize: 18, color: Colors.amberAccent),
                  ),
                  SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => ref
                          .read(favoritesProvider.notifier)
                          .addFavouriteItem(quotes),
                      child: Text('Add to favourite'),
                    ),
                  ),
                  SizedBox(height: 10,),

                   SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute
                      (builder: (context)=>FavScreen())),
                      child: Text('see favourites ❤️❤️❤️❤️'),
                    ),
                  ),
                  SizedBox(height: 10,),
                   SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute
                      (builder: (context)=>QuoteOfTheDayScreen())),
                      child: Text('Quote OF the DAYYYYYYYYYYYYYYYYYY'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(quoteProvider.notifier).getNewQuotes();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
