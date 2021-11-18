// ignore: import_of_legacy_library_into_null_safe
import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/gestures.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/game/base_game.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';
import 'package:flappy_game/components/pipe_set.dart';
import 'package:flappy_game/components/titles.dart';
import 'package:flappy_game/game_State.dart';

import 'components/bird.dart';
import 'components/floor.dart';
import 'package:flappy_game/main.dart';

import 'components/score.dart';

class MyGame extends BaseGame with TapDetector {
  Bird _bird = Bird();
  Floor _floor = Floor();
  Titles _titles=Titles();
  PipeSet _pipeSet=PipeSet();
  Score _score=Score();


  MyGame() {
    _bird = Bird();
    _floor = Floor();
    _titles= Titles();
    _pipeSet= PipeSet();
    _score = Score();

    add(SpriteComponent.fromSprite(size.width, size.height, Sprite('bg.png')));
    add(_pipeSet);
    add(_bird);
    add(_floor);
    add(_titles);
    add(_score);

  }
  @override
  void update(double t) {
    // TODO: implement update
    super.update(t);
    if(gameState == GameState.play){
        if(checkIf2CompoCollision(_bird.toRect(), _floor.toRect())){
          print("game over");
          gameState=GameState.gameover;
        }
        if(checkIf2CompoCollision(_bird.toRect(), _pipeSet.getPipeUpRect())){
          print("game over");
          gameState=GameState.gameover;
        }
        if(checkIf2CompoCollision(_bird.toRect(), _pipeSet.getPipeDownRect())){
          print("game over");
          setGameOver();
        }
        checkIfBirdPassedPipe();
    }
  }

  void setGameOver(){
    Flame.audio.play("hit.wav");
    Flame.audio.play("die.mp3");

    gameState=GameState.gameover;



  }
  @override
  void onTap() {
    _bird.onTap();
    switch(gameState){

      case GameState.pause:
        gameState = GameState.play;
        break;
      case GameState.play:
        // TODO: Handle this case.
        break;
      case GameState.gameover:
        gameState = GameState.pause;
        _score.resetScore();
        break;
    }
  }
  bool checkIf2CompoCollision(Rect item1, Rect item2){
    var intersectedRect = item1.intersect(item2);
    return intersectedRect.width >2 && intersectedRect.height >2;
  }

  void checkIfBirdPassedPipe(){
    if(_pipeSet.hadScored) return;

    if(_pipeSet.getPipeUpRect().right < _bird.toRect().left){
      print("Score!!!!");
      Flame.audio.play("point.mp3");
      _score.addScore();
      _pipeSet.scoreUpdated();

      //return true;
    }
    //return false;

  }
}
