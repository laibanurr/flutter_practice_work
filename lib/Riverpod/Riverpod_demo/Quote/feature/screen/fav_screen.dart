import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/core/model/providers_quote.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(favoritesProvider);
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: favs.length,
          itemBuilder: (BuildContext, index) {
            return ListTile(title: Text(favs[index].text));
          },
        ),
      ),
    );
  }
}
