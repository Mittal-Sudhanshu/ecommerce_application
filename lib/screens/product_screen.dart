import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controllers/counterController.dart';
import 'package:ecommerce/controllers/wishlist_controller.dart';
import 'package:ecommerce/helperWidget/appStyle.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../helperWidget/ImageConstans.dart';
import '../helperWidget/appDecoration.dart';
import '../helperWidget/colorConstants.dart';
import '../helperWidget/custom_image_view.dart';
import '../helperWidget/sizeutils.dart';

// import '../helperWidget/sizeutils.dart';

class ProductScreen extends StatelessWidget {
  final Products product;
  const ProductScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final WishlistController wishlistController = Get.put(WishlistController());
    final size = MediaQuery.of(context).size;
    final CounterController counterController = Get.put(CounterController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: ButtonBar(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.,
        // crossAxisAlignment: CrossAxisAlignment,
        // buttonMinWidth: size.width,
        children: [
          Obx(
            () => !counterController.isVisible.value
                ? GestureDetector(
                    onTap: () {
                      counterController.isVisible.value = true;
                      counterController.incremet();
                    },
                    child: const ButtonBar(
                      children: [
                        Text('Add to Cart'),
                        Icon(Icons.shopping_cart),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {},
                    child: Text('Go to Cart'),
                  ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ButtonBar(
              children: [
                Text('Buy Now'),
                Icon(Icons.shopping_cart),
              ],
            ),
          )
        ],
      ),
      // appBar: AppBar(
      //   // bottom: ,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(onPressed: (){Navigator.pop(context)}, Cu)
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              CarouselSlider(
                options: CarouselOptions(
                  // height: 400,
                  aspectRatio: 1,
                  // viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: product.image
                    .map(
                      (e) => Builder(
                        builder: ((context) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.grey,
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(e.url),
                                      ),
                                    ),
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
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder15,
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
                                        decoration: AppDecoration
                                            .fillWhiteA700cc
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder15,
                                        ),
                                        child: Stack(
                                          children: [
                                            Obx(
                                              () => CustomImageView(
                                                onTap: () async {
                                                  wishlistController
                                                          .checkWishlist(
                                                              product.id)
                                                      ? await wishlistController
                                                          .removeFromWishlist(
                                                              product.id)
                                                      : await wishlistController
                                                          .addToWishlist(
                                                              product.id);
                                                  await wishlistController
                                                      .getWishlist();
                                                  wishlistController
                                                      .checkWishlist(
                                                          product.id);
                                                },
                                                svgPath: !wishlistController
                                                        .checkWishlist(
                                                            product.id)
                                                    ? ImageConstant.imgFavorite
                                                    : ImageConstant
                                                        .imgFavorite44x44,
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
                            )),
                      ),
                    )
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText(
                      product.title,
                      style: AppStyle.txtPoppinsBold20,
                    ),
                    // Obx(
                    //   () => Visibility(
                    //     visible: counterController.isVisible.value,
                    //     child: Row(
                    //       children: [
                    //         IconButton(
                    //           enableFeedback:
                    //               counterController.x > 0 ? true : false,
                    //           onPressed: () {
                    //             // ignore: unrelated_type_equality_checks
                    //             if (counterController.x != 0) {
                    //               counterController.decrement();
                    //             }
                    //           },
                    //           icon: Icon(
                    //             FontAwesomeIcons.minus,
                    //             // ignore: unrelated_type_equality_checks
                    //             color: counterController.x != 0
                    //                 ? Colors.black
                    //                 : Colors.grey,
                    //           ),
                    //         ),
                    //         AutoSizeText(counterController.x.toString()),
                    //         IconButton(
                    //           onPressed: () {
                    //             if (counterController.x < product.stock) {
                    //               counterController.incremet();
                    //             }
                    //           },
                    //           icon: const Icon(Icons.add),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: AutoSizeText(
                  product.details,
                  style: AppStyle.txtPoppinsSemiBold16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
