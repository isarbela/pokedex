import 'package:flutter/cupertino.dart';
import 'package:home/common/exceptions/failure.dart';
import 'package:home/common/models/pokemon.dart';
import 'package:home/common/repositories/pokemon_repository.dart';
import 'package:home/features/pokedex/screens/details/container/details_container.dart';
import 'package:home/features/pokedex/screens/home/pages/home_error.dart';
import 'package:home/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:home/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return HomeLoading();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return HomePage(pokemonList: snapshot.data!, onItemTap: onItemTap);
          }
          if (snapshot.hasError) {
            return HomeError(error: (snapshot.error as Failure).message!);
          }

          return Container();
        });
  }
}
