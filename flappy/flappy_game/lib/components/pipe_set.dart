// ignore: import_of_legacy_library_into_null_safe
import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';
import '../main.dart';

class PipSet extends Component{
  static double pipeH = size.Height /12*7;
  static double pipeW = pipeH/160*26;
  static double pipGap =4;

   Sprite _pipUp = Sprite("pipe_up.png");
   Sprite _pipDown = Sprite("pipe_down.png");

  @override
  void render(Canvas c) {
    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

}