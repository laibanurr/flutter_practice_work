import 'dart:async';

import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/core/model/quote.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/service/quote_ser.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final quoteServiceProvider = Provider<QuoteService>((ref) => QuoteService());
final randomeQuoteProvider = FutureProvider<Quote>((ref) async {
  final service = ref.watch(quoteServiceProvider);
  return service.getRandomeQuote();
});

//WITH ASYNCNOTIFIER🙄🙄🙄//
class QuoteNotifier extends AsyncNotifier<Quote> {
  @override
  Future<Quote> build() async {
    final service = ref.watch(quoteServiceProvider);
    return service.getRandomeQuote();
  }

  Future<void> getNewQuotes() async {
    state = AsyncValue.loading();
    final service = ref.watch(quoteServiceProvider);
    state = await AsyncValue.guard(() => service.getRandomeQuote());
  }
}

final quoteProvider = AsyncNotifierProvider<QuoteNotifier, Quote>(
  () => QuoteNotifier(),
);

class FavoritesNotifier extends Notifier<List<Quote>> {
  @override
  List<Quote> build() => [];

  void addFavouriteItem(Quote quote) {
    state = [...state, quote];
  }
}

final favoritesProvider = NotifierProvider<FavoritesNotifier, List<Quote>>(
  () => FavoritesNotifier(),
);
//AUTO DISPOSE 

final quoteOfTheDayProvider = FutureProvider.autoDispose.family<Quote, DateTime>((ref, date) async {
  final service = ref.watch(quoteServiceProvider);

  // Turn the date into a deterministic, stable "quote ID" — same date always → same ID
  final dayNumber = date.year * 10000 + date.month * 100 + date.day;
  final quoteId = (dayNumber % 30) + 1;   // dummyjson quotes go up to ~100+, keep it safely in range

  return service.getQuoteById(quoteId);
});