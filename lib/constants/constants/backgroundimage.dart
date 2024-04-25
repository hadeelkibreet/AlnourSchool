import 'package:flutter/material.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF092D71), // Hex 092D71FF
                Color(0xF441007F),
              ], // Specify your two colors here
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ),
          ),
        )
      ],
    );
  }
}
