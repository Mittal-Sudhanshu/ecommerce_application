import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray5001 = fromHex('#fbfbfb');

  static Color gray5002 = fromHex('#fafafa');

  static Color blueGray400 = fromHex('#878787');

  static Color blueA400 = fromHex('#347efb');

  static Color gray90000 = fromHex('#00061023');

  static Color gray900 = fromHex('#061023');

  static Color gray90001 = fromHex('#1b2028');

  static Color indigo507f = fromHex('#7fe5eaf4');

  static Color gray200 = fromHex('#eaeaea');

  static Color gray300 = fromHex('#dfdfdf');

  static Color gray50 = fromHex('#fafafb');

  static Color gray30001 = fromHex('#e2e2e2');

  static Color gray100 = fromHex('#f6f6f6');

  static Color gray9001c = fromHex('#1c292526');

  static Color whiteA700Cc = fromHex('#ccffffff');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color gray10001 = fromHex('#f4f4f4');

  static Color gray20001 = fromHex('#ededed');

  static Color whiteA70019 = fromHex('#19ffffff');

  static Color blueGray700 = fromHex('#4e5562');

  static Color whiteA700 = fromHex('#ffffff');

  static Color black90026 = fromHex('#26000000');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
