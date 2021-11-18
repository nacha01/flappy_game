// ignore: import_of_legacy_library_into_null_safe
import 'dart:collection';
import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/components/component.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flame/sprite.dart';
import 'package:flappy_game/consts/sprite_dimentions.dart';

import '../main.dart';

class Score extends PositionComponent{
  static final double numW = size.width /20;
  static final double numH = numW / 12 * 18;
  final HashMap<String, Sprite> _digits;

  SpriteComponent _oneDigit=SpriteComponent();
  SpriteComponent _twoDigit=SpriteComponent();
  SpriteComponent _threeDigit=SpriteComponent();

  int _score =0;

  Score()
      :  _digits =HashMap.from({
      "0":Sprite.fromImage(spriteSheet,
      width:SpriteDimentions.numberWidth,
      height:SpriteDimentions.numberHeight,
      x:SpritePositions.zeroNumberX,
      y:SpritePositions.zeroNumberY),

          "1":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.firstNumberX,
          y:SpritePositions.firstNumberY),

          "2":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.secondNumberX,
          y:SpritePositions.secondNumberY),

          "3":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.thirdNumberX,
          y:SpritePositions.thirdNumberY),

          "4":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.fourthNumberX,
          y:SpritePositions.fourthNumberY),

          "5":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.fifthNumberX,
          y:SpritePositions.fifthNumberY),

          "6":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.sixthNumberX,
          y:SpritePositions.sixthNumberY),

          "7":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.seventhNumberX,
          y:SpritePositions.seventhNumberY),

          "8":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.eighthNumberX,
          y:SpritePositions.eighthNumberY),

          "9":Sprite.fromImage(spriteSheet,
          width:SpriteDimentions.numberWidth,
          height:SpriteDimentions.numberHeight,
          x:SpritePositions.ninethNumberX,
          y:SpritePositions.ninethNumberY)
        }){
           _oneDigit= SpriteComponent.fromSprite(numW, numH, _digits["0"]);
           _twoDigit= SpriteComponent.fromSprite(numW, numH, _digits["0"]);
           _threeDigit= SpriteComponent.fromSprite(numW, numH, _digits["0"]);
           _oneDigit.x = numW*8;
           _twoDigit.x = numW*1.5;
           _threeDigit.x = numW*1.5;
           _oneDigit.y=numH;
          }

  void addScore(){
    _score++;
  }
  void resetScore(){
    _score =0;
  }

  @override
  void render(Canvas c) {
    String scoreInstr = _score.toString().padLeft(3,"0");
    _oneDigit.sprite = _digits[scoreInstr[0]];
    _twoDigit.sprite = _digits[scoreInstr[1]];
    _threeDigit.sprite = _digits[scoreInstr[2]];


    _oneDigit.render(c);
    _twoDigit.render(c);
    _threeDigit.render(c);
  }

}