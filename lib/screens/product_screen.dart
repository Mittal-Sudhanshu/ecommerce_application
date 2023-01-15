import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/wishlist_controller.dart';
import 'package:ecommerce/helperWidget/appStyle.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // final CounterController counterController = Get.put(CounterController());
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => !cartController.checkInCart(product.id)
              ? GestureDetector(
                  onTap: () async {
                    // counterController.isVisible.value = true;
                    // counterController.incremet();
                    // print(Stopwatch().start);
                    // print(cartController.checkInCart(product.id));
                    await cartController.addToCart(product.id);
                    await cartController.getCartItems();
                    await cartController.checkInCart(product.id);
                    // cartController.checkInCart(product.id)
                  },
                  child: Material(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5),
                    shadowColor: Colors.purple,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Add to Cart',
                            style: GoogleFonts.poppins(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    // counterController.isVisible.value = true;
                    // counterController.incremet();
                    // print(Stopwatch().start);
                    // print(cartController.checkInCart(product.id));
                    // cartController.addToCart(product.id);
                  },
                  child: Material(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5),
                    shadowColor: Colors.lightBlue,
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.shopping_bag_outlined),
                          Text('Go to Cart')
                        ],
                      ),
                    ),
                  ),
                ),
        ),
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
                                  AnimatedContainer(
                                    duration: const Duration(seconds: 5),
                                    margin: EdgeInsets.all(10),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AutoSizeText(
                  'Sold By: ${product.seller.name}',
                  style: AppStyle.txtPoppinsRegular14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
