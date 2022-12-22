import 'package:ecommerce/helperWidget/sizeutils.dart';
import 'package:flutter/material.dart';

import 'colorConstants.dart';
// import 'package:sudhanshu_mittal_s_application/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillWhiteA70019 => BoxDecoration(
        color: ColorConstant.whiteA70019,
      );
  static BoxDecoration get txtOutlineGray20001 => BoxDecoration(
        color: ColorConstant.whiteA700,
        border: Border.all(
          color: ColorConstant.gray20001,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtOutlineGray200011 => BoxDecoration(
        color: ColorConstant.gray90001,
        border: Border.all(
          color: ColorConstant.gray20001,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get fillGray10001 => BoxDecoration(
        color: ColorConstant.gray10001,
      );
  static BoxDecoration get gradientGray900Gray90000 => BoxDecoration(
        color: ColorConstant.whiteA700,
        gradient: LinearGradient(
          begin: Alignment(
            0.21,
            1,
          ),
          end: Alignment(
            0.21,
            0,
          ),
          colors: [
            ColorConstant.gray900,
            ColorConstant.gray90000,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA700cc => BoxDecoration(
        color: ColorConstant.whiteA700Cc,
      );
  static BoxDecoration get txtFillGray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get outlineIndigo507f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.indigo507f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBluegray700 => BoxDecoration(
        border: Border.all(
          color: ColorConstant.blueGray700,
          width: getHorizontalSize(
            1.00,
          ),
        ),
      );
  static BoxDecoration get txtOutlineIndigo507f => BoxDecoration(
        color: ColorConstant.whiteA700,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.indigo507f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
  static BoxDecoration get fillGray5001 => BoxDecoration(
        color: ColorConstant.gray5001,
      );
}

class BorderRadiusStyle {
  static BorderRadius txtCircleBorder16 = BorderRadius.circular(
    getHorizontalSize(
      16.00,
    ),
  );

  static BorderRadius circleBorder12 = BorderRadius.circular(
    getHorizontalSize(
      12.00,
    ),
  );

  static BorderRadius roundedBorder15 = BorderRadius.circular(
    getHorizontalSize(
      15.00,
    ),
  );

  static BorderRadius roundedBorder24 = BorderRadius.circular(
    getHorizontalSize(
      24.00,
    ),
  );

  static BorderRadius roundedBorder32 = BorderRadius.circular(
    getHorizontalSize(
      32.00,
    ),
  );

  static BorderRadius roundedBorder20 = BorderRadius.circular(
    getHorizontalSize(
      20.00,
    ),
  );

  static BorderRadius customBorderBL32 = BorderRadius.only(
    bottomLeft: Radius.circular(
      getHorizontalSize(
        32.00,
      ),
    ),
    bottomRight: Radius.circular(
      getHorizontalSize(
        32.00,
      ),
    ),
  );

  static BorderRadius txtCircleBorder13 = BorderRadius.circular(
    getHorizontalSize(
      13.00,
    ),
  );
}
