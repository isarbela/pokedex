import 'package:flutter/material.dart';
import 'package:home/common/models/pokemon.dart';

class DetailsItemListWidget extends StatelessWidget {
  const DetailsItemListWidget(
      {Key? key, required this.isDiff, required this.pokemon})
      : super(key: key);
  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: isDiff ? 0.3 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            tween: Tween<double>(
                end: isDiff ? 200 : 300, begin: isDiff ? 300 : 200),
            builder: (context, value, child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiff ? Colors.black.withOpacity(0.3) : null,
              );
            }),
      ),
    );
  }
}