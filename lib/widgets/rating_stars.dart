import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int ratings;

  RatingStars({@required this.ratings});
  @override
  Widget build(BuildContext context) {
    List<Icon> stars = [];
    for (int i = 0; i < ratings; i++) {
      stars.add(Icon(
        Icons.star,
        color: Colors.yellow,
      ));
    }
    return Row(
      children: stars,
    );
  }
}
