import 'package:flutter/material.dart';
import 'package:home/common/models/pokemon.dart';
import 'package:home/features/pokedex/screens/details/pages/widget/details_appbar_widget.dart';
import 'package:home/features/pokedex/screens/details/pages/widget/details_list_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailsAppBarWidget(
            pokemon: pokemon,
            onBack: onBack,
          ),
          DetailsListWidget(
            pokemon: pokemon,
            list: list,
            controller: controller,
            onChangePokemon: onChangePokemon,
          ),
        ],
      ),
    );
  }
}

