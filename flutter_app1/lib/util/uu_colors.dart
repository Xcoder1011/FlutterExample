
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class UUColos {

  /// hex -> color
  static Color hexString(String hexString , {double alpha = 1}) {
    if (alpha < 0){
      alpha = 0;
    }else if (alpha > 1){
      alpha = 1;
    }
    if (int.tryParse(hexString.substring(1, 7), radix: 16) == null) {
      hexString = '#999999';
    }
    int hex = int.tryParse(hexString.substring(1, 7), radix: 16);
    return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
    (hex & 0x00FF00) >> 8,
    (hex & 0x0000FF) >> 0,
    alpha);

    // return Color(int.parse(hexString.substring(1,7) , radix: 16) + 0xFF000000);
  }

  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color hexColor(int hex,{double alpha = 1}){
    if (alpha < 0){
      alpha = 0;
    }else if (alpha > 1){
      alpha = 1;
    }
    return Color.fromRGBO((hex & 0xFF0000) >> 16 ,
        (hex & 0x00FF00) >> 8,
        (hex & 0x0000FF) >> 0,
        alpha);
  }

  /// 十六进制颜色，
  /// hex, 十六进制值，例如：0xffffff,
  /// alpha, 透明度 [0.0,1.0]
  static Color randomColor(){
    int r = Random.secure().nextInt(255);
    int g = Random.secure().nextInt(255);
    int b = Random.secure().nextInt(255);
    return Color.fromARGB(255, r, g, b);
  }

  /// 淡黄色
  static const hexFF5C11 = Color(0xFFFF5C11);

  /// 绿色
  static const hex00AD54 = Color(0xFF00AD54);

  /// 颜色0x222222
  static const Color hex222222 = Color(0xFF222222);

  /// 颜色0x333333
  static const Color hex333333 = Color(0xFF333333);

  /// 颜色0x666666
  static const Color hex666666 = Color(0xFF666666);

  /// 颜色0x999999
  static const Color hex999999 = Color(0xFF999999);

  /// 颜色0xF8F9FA
  static const Color hexF8F9FA = Color(0xFFF8F9FA);

  /// 颜色0xE8E8E8
  static const Color hexE8E8E8 = Color(0xFFE8E8E8);
  static const Color separateLine = hexE8E8E8;

  /// 颜色0xF56558
  static const Color hexF56558 = Color(0xFFF56558);

  /// 颜色0xFF5762
  static const Color hexFF5762 = Color(0xFFFF5762);
  
}