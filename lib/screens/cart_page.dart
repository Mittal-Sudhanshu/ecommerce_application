import 'package:ecommerce/controllers/cart_controller.dart';
import 'package:ecommerce/controllers/counterController.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
        bottomSheet: ElevatedButton(onPressed: () {}, child: Text('Buy Now')),
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: SafeArea(
          child: Obx(
            () => ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Container(
                              height: 70,
                              width: 70,
                              // borderRadius: BorderRadius.circular(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(cartController
                                          .cartItems[index]
                                          .productId
                                          .image
                                          .first
                                          .url),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartController
                                      .cartItems[index].productId.title,
                                  style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(
                                  cartController
                                      .cartItems[index].productId.details,
                                  maxLines: 5,
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w500,
                                    // fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              await cartController.updateCart(
                                  cartController.cartItems[index].count - 1,
                                  cartController.cartItems[index].id);
                              await cartController.getCartItems();
                            },
                            icon: const Icon(FontAwesomeIcons.minus),
                          ),
                          Obx(
                            () => Text(
                              cartController.cartItems[index].count.toString(),
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await cartController.updateCart(
                                  cartController.cartItems[index].count + 1,
                                  cartController.cartItems[index].id);
                              await cartController.getCartItems();
                            },
                            icon: const Icon(FontAwesomeIcons.plus),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
