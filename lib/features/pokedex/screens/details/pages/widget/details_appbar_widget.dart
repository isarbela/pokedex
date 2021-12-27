import 'package:flutter/material.dart';
import 'package:home/common/models/pokemon.dart';

class DetailsAppBarWidget extends StatelessWidget {
  const DetailsAppBarWidget({
    Key? key,
    required this.pokemon,
    required this.onBack,
  }) : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        elevation: 0,
        backgroundColor: pokemon.baseColor,
        leading: IconButton(
          onPressed: onBack,
          icon: Icon(Icons.chevron_left),
        ),
      ),
    );
  }
}