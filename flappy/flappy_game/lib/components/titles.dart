import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';
import 'package:flappy_game/game_State.dart';

import 'package:flappy_game/main.dart';

class Titles extends Component {
  Sprite _getReady = Sprite.fromImage(spriteSheet, x:295, y:59, width: 92, height: 25);
  Sprite _gameover = Sprite.fromImage(spriteSheet, x:395, y:59, width: 96, height: 25);
  double ySize=0;
  double xSize=0;

  @override
  void render(Canvas c) {

    switch(gameState){

      case GameState.pause:
        xSize = size.width *0.6;
        ySize = xSize/92*25;
        _getReady.renderPosition(c, Position(size.width*0.2, size.height*0.2), size: Position(xSize,ySize));

        break;
      case GameState.play:
        // TODO: Handle this case.
        break;
      case GameState.gameover:
        xSize = size.width *0.6;
        ySize = xSize/96*25;
        _gameover.renderPosition(c, Position(size.width*0.2, size.height*0.2), size: Position(xSize,ySize));

        break;
    }

    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
  }

}