import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with FlareController {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: 128.0,
      child: Center(
        child: FlareActor(
          'res/images/loadingAnimation.flr',
          controller: this,
          animation: 'Untitled',
        ),
      ),
    );
  }

  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    return true;
  }

  @override
  void initialize(FlutterActorArtboard artboard) {}

  @override
  void setViewTransform(Mat2D viewTransform) {}
}
