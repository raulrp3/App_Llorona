import 'package:flutter/material.dart';
import 'package:llorona_app/components/clip_painter.dart';

class BezierContainer extends StatelessWidget {
  final double angle;
  final Color color;

  BezierContainer({@required this.angle, @required this.color}) : assert(angle != null);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: Transform.rotate(
        angle: this.angle,
        child: ClipPath(
          clipper: ClipPainter(),
          child: Container(
            height: size.height * .5,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color,
                  color.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
