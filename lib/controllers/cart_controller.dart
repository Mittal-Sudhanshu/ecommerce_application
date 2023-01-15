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
    print('hua call');
    final url = '${dotenv.env['MAIN_URL']}/cart';
    var resposne =
        await http.get(Uri.parse(url), headers: Constants().authHeader);
    if (resposne.statusCode == 200) {
      cartItems.value = cartModelFromJson(resposne.body);
      print(cartItems.value);
    }
  }

  checkInCart(String id) {
    for (var i in cartItems) {
      if (i.productId.id == id) {
        return true;
      }
    }
    return false;
  }

  updateCart(int count, String cartItemId) async {
    print(count);
    final url = '${dotenv.env['MAIN_URL']}/cart/$cartItemId';
    var resposne = await http.patch(Uri.parse(url),
        body: jsonEncode({"count": count}), headers: Constants().authHeader);
    print(resposne.body);
    print(resposne.statusCode);
    await getCartItems();
  }

  addToCart(String productId) async {
    final url = '${dotenv.env['MAIN_URL']}/cart';
    var resposne = await http.post(Uri.parse(url),
        headers: Constants().authHeader,
        body: jsonEncode({"productId": productId}));
    print(resposne.statusCode);
    print(resposne.body);

    return resposne.statusCode;
  }
}
