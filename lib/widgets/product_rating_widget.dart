import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vievif/utils/colors.dart';

class RatingWidget extends StatelessWidget {
  final rating;


  RatingWidget({@required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SmoothStarRating(
            color: kYellowish,
            rating: double.parse(rating),
            isReadOnly: true,
            size: 25,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
            starCount: 5,
            allowHalfRating: true,
            spacing: 2.0,
          ),
        ),
        Text(rating),
      ],
    );
  }
}
