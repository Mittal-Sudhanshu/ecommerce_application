import 'package:ecommerce/helperWidget/colorConstants.dart';
import 'package:ecommerce/helperWidget/sizeutils.dart';
import 'package:flutter/material.dart';
// import 'package:sudhanshu_mittal_s_application/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          all: 8,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillWhiteA700cc:
        return ColorConstant.whiteA700Cc;
      case IconButtonVariant.OutlineGray9001c:
        return ColorConstant.gray5002;
      case IconButtonVariant.OutlineGray200:
        return null;
      default:
        return ColorConstant.gray900;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineGray200:
        return Border.all(
          color: ColorConstant.gray200,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.OutlineBlack90026:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillWhiteA700cc:
      case IconButtonVariant.OutlineGray9001c:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineGray9001c:
        return [
          BoxShadow(
            color: ColorConstant.gray9001c,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              5,
            ),
          )
        ];
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillWhiteA700cc:
      case IconButtonVariant.OutlineGray200:
        return null;
      default:
        return [
          BoxShadow(
            color: ColorConstant.black90026,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          )
        ];
    }
  }
}

enum IconButtonShape {
  CircleBorder20,
}

enum IconButtonPadding {
  PaddingAll8,
}

enum IconButtonVariant {
  OutlineBlack90026,
  FillWhiteA700,
  FillWhiteA700cc,
  OutlineGray9001c,
  OutlineGray200,
}
