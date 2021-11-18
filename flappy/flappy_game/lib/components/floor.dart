// ignore: import_of_legacy_library_into_null_safe
import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/position.dart';
import 'package:flappy_game/game_State.dart';
import 'package:flappy_game/options.dart';
import '../main.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';

class Floor extends Component{
  // ignore: prefer_final_fields
  Sprite _floorSprite = Sprite('floor.png');
  double ySize=0;
  double xSize=0;
  double xPos=0;

  @override
  void render(Canvas c) {
    // TODO: implement render
    xSize = size.width *2;
    ySize = xSize/168*56;


    _floorSprite.renderPosition(c, Position(xPos, size.height-ySize*0.22), size: Position(xSize,ySize));
  }

  @override
  void update(double t) {
    switch(gameState){

      case GameState.pause:
        // TODO: Handle this case.
        break;
      case GameState.play:
        xPos -=t*(30+GAME_SPEED);
        if (xPos.abs()>=size.width){
          xPos=0;
      }
        break;
      case GameState.gameover:
        // TODO: Handle this case.
        break;
    }
    // TODO: implement update

  }
  Rect toRect(){
    return Rect.fromLTWH(0, size.height-ySize*0.22, xSize, ySize);
  }

}