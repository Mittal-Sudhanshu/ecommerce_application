// ignore_for_file: unused_import

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/controllers/wishlist_controller.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/image.dart' as Image;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helperWidget/ImageConstans.dart';
import '../helperWidget/appDecoration.dart';
import '../helperWidget/appStyle.dart';
import '../helperWidget/colorConstants.dart';
import '../helperWidget/custom_icon_button.dart';
import '../helperWidget/custom_image_view.dart';
import '../helperWidget/sizeutils.dart';
// import 'package:shopx/models/product.dart';

class ProductTile extends StatelessWidget {
  final Products product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController wishlistController = Get.put(WishlistController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: getVerticalSize(
                210.00,
              ),
              width: getHorizontalSize(
                160.00,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: getVerticalSize(
                        190.00,
                      ),
                      width: getHorizontalSize(
                        160.00,
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          CustomImageView(
                            url: product.image[0].url,
                            radius: BorderRadius.circular(20),
                            height: getVerticalSize(
                              190.00,
                            ),
                            width: getHorizontalSize(
                              160.00,
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 5,
                              margin: getMargin(
                                top: 5,
                                right: 5,
                              ),
                              color: ColorConstant.whiteA700Cc,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyle.roundedBorder15,
                              ),
                              child: Container(
                                height: getSize(
                                  30.00,
                                ),
                                width: getSize(
                                  30.00,
                                ),
                                padding: getPadding(
                                  all: 6,
                                ),
                                decoration:
                                    AppDecoration.fillWhiteA700cc.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder15,
                                ),
                                child: Stack(
                                  children: [
                                    Obx(
                                      () => CustomImageView(
                                        onTap: () async {
                                          wishlistController
                                                  .checkWishlist(product.id)
                                              ? await wishlistController
                                                  .removeFromWishlist(
                                                      product.id)
                                              : await wishlistController
                                                  .addToWishlist(product.id);
                                          await wishlistController
                                              .getWishlist();
                                          wishlistController
                                              .checkWishlist(product.id);
                                        },
                                        svgPath: !wishlistController
                                                .checkWishlist(product.id)
                                            ? ImageConstant.imgFavorite
                                            : ImageConstant.imgFavorite44x44,
                                        height: getSize(
                                          18.00,
                                        ),
                                        width: getSize(
                                          18.00,
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomIconButton(
                    height: 40,
                    width: 40,
                    alignment: Alignment.bottomCenter,
                    child: CustomImageView(
                      svgPath: ImageConstant.imgBag40x40,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            top: 7,
          ),
          child: Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsRegular12,
          ),
        ),
        Padding(
          padding: getPadding(
            top: 1,
          ),
          child: Text(
            '₹${product.price.toString()}',
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsSemiBold14,
          ),
        ),
      ],
    );
    ;
  }
}
