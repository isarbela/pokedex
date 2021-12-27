import 'package:flutter/material.dart';
import 'package:home/common/models/pokemon.dart';
import 'package:home/features/pokedex/screens/details/container/details_container.dart';
import 'package:home/features/pokedex/screens/home/pages/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget(
      {Key? key,
      required this.pokemon,
      required this.onTap,
      required this.index})
      : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(
              '/details',
              DetailArguments(pokemon: pokemon, index: index),
            ),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: pokemon.baseColor!.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  pokemon.image,
                                  height: 90,
                                ),
                              ),
                          ],
                        ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            pokemon.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pokemon.num,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
