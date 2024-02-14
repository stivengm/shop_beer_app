import 'package:flutter/material.dart';
import 'package:shop_beer_app/ui/views/favorites_view/widgets/favorites_empy.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const FavoritesEmpy(),
    );
  }
}