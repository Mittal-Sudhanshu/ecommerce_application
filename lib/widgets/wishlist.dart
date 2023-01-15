import 'package:ecommerce/controllers/wishlist_controller.dart';
import 'package:ecommerce/screens/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helperWidget/ImageConstans.dart';
import '../helperWidget/custom_image_view.dart';
import '../helperWidget/sizeutils.dart';

Widget wishlistWidget(BuildContext context) {
  WishlistController wishlistController = Get.put(WishlistController());
  return Scaffold(
    appBar: AppBar(actions: [
      IconButton(
          onPressed: () {
            Get.to(() => const CartPage());
          },
          icon: const Icon(FontAwesomeIcons.cartShopping))
    ]),
    body: Obx(
      () => ListView.builder(
        itemCount: wishlistController.wishlist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      // borderRadius: BorderRadius.circular(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${wishlistController.wishlist[index].product!.image!.first!.url}'),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${wishlistController.wishlist[index].product?.title}',
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '${wishlistController.wishlist[index].product?.details}',
                            maxLines: 5,
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Obx(
                  () => CustomImageView(
                    onTap: () async {
                      wishlistController.checkWishlist(
                              '${wishlistController.wishlist[index].product?.id}')
                          ? await wishlistController.removeFromWishlist(
                              '${wishlistController.wishlist[index].product?.id}')
                          : await wishlistController.addToWishlist(
                              '${wishlistController.wishlist[index].product?.id}');
                      await wishlistController.getWishlist();
                      wishlistController.checkWishlist(
                          '${wishlistController.wishlist[index].product?.id}');
                    },
                    svgPath: !wishlistController.checkWishlist(
                            '${wishlistController.wishlist[index].product?.id}')
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
          );
        },
      ),
    ),
  );
}
