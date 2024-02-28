import 'package:e_commerce/features/favorites/view/widgets/favorites_body.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: buildFavoritesBody(context),
    );
  }
}
