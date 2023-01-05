import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/cart_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  var cartItems = <CartModel>[].obs;
  getCartItems() async {
    final url = '${dotenv.env['MAIN_URL']}/cart';
    var resposne =
        await http.get(Uri.parse(url), headers: Constants().authHeader);
    if (resposne.statusCode == 200) {
      cartItems.value = cartModelFromJson(resposne.body);
      print(cartItems
          .map((element) => element.productId.image.map((e) => e.url)));
    }
  }

  addToCart(String productId) async {
    final url = '${dotenv.env['MAIN_URL']}/cart';
    var resposne = await http.post(Uri.parse(url),
        headers: Constants().authHeader,
        body: jsonEncode({"productId": productId}));
    return resposne.statusCode;
  }
}
