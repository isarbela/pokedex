import 'package:flutter/material.dart';
import 'package:home/common/models/pokemon.dart';
import 'package:home/features/pokedex/screens/details/container/details_container.dart';
import 'package:home/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pokemonList, required this.onItemTap})
      : super(key: key);

  final List<Pokemon> pokemonList;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Pokedex",
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.count(
            childAspectRatio: (100 / 125),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: pokemonList
                .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemTap,
                    index: pokemonList.indexOf(e),
                  ),
                ).toList(),
          ),
        ));
  }
}
