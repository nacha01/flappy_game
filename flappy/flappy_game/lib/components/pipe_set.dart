// ignore: import_of_legacy_library_into_null_safe
import 'dart:math';
import 'dart:ui';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/position.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';
import 'package:flappy_game/game_State.dart';
import 'package:flappy_game/options.dart';
import '../main.dart';

class PipeSet extends Component{
  static double pipeH = size.height /12*7;
  static double pipeW = pipeH/160*26;
  static double pipeGap =4;

   Sprite _pipeUp = Sprite("pipe_up.png");
   Sprite _pipeDown = Sprite("pipe_down.png");
   double pipePos = size.width;
   int pipeLevel = 1;
   bool hadScored=false;


  @override
  void render(Canvas c) {
    _pipeUp.renderPosition(c,Position(pipePos, pipeH/7*(pipeLevel-7)),size: Position(pipeW, pipeH));
    _pipeDown.renderPosition(c,Position(pipePos, pipeH/7*(pipeLevel+pipeGap)),size: Position(pipeW, pipeH));
  }

  @override
  void update(double t) {
    switch(gameState){

      case GameState.pause:
        pipePos=size.width;
        hadScored = false;
        break;
      case GameState.play:
        if(pipePos <-pipeW){
          pipePos =size.width;
          hadScored = false;
          pipeLevel=Random().nextInt(5);
          if(pipeLevel==0)
            pipeLevel=6;
        }
        pipePos -=t*(30+GAME_SPEED);

        break;
      case GameState.gameover:
        // TODO: Handle this case.
        break;
    }



  }
  Rect getPipeUpRect(){
    return Rect.fromLTWH(pipePos, pipeH/7*(pipeLevel-7), pipeW, pipeH);

  }
  Rect getPipeDownRect(){
    return Rect.fromLTWH(pipePos, pipeH/7*(pipeLevel+pipeGap), pipeW, pipeH);

  }
  void scoreUpdated(){
    hadScored=true;
  }

}