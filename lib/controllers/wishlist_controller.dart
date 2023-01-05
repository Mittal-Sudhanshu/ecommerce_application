import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/wishlist_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WishlistController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getWishlist();
    super.onInit();
  }

  var wishlist = <Wishlist>[].obs;
  getWishlist() async {
    final url = '${dotenv.env['MAIN_URL']}/wishlist';
    try {
      var response =
          await http.get(Uri.parse(url), headers: Constants().authHeader);
      // print(response.body);
      wishlist.value = wishlistFromJson(response.body);
      // print(jsonDecode(response.body));
    } catch (er) {
      throw Error;
    }
  }

  checkWishlist(String id) {
    // print(id);
    // print(wishlist.isEmpty);
    for (var i in wishlist) {
      if (i.product == id) {
        return true;
      }
    }

    return false;
  }

  returnId(String id) {
    // print(id);
    for (var i in wishlist) {
      // print(i.product);
      // print(i.product == id ? true : false);
      // print(id);
      // print(id + "   " + i.product);
      if (i.product == id) {
        // print(id);
        return i.id;
      }
    }

    return id;
  }

  addToWishlist(String id) async {
    final url = '${dotenv.env["MAIN_URL"]}/wishlist';
    try {
      var response = await http.post(Uri.parse(url),
          body: jsonEncode({"product": id}), headers: Constants().authHeader);
      // print(jsonDecode(response.body));
      // print('ho gaya /add');
    } catch (er) {
      printError();
    }
  }

  removeFromWishlist(String id) async {
    final url = '${dotenv.env["MAIN_URL"]}/wishlist?wishlist=${returnId(id)}';
    try {
      var response =
          await http.delete(Uri.parse(url), headers: Constants().authHeader);
      // print(jsonDecode(response.body));
      // print("ho gaya delete");
    } catch (er) {
      printError();
    }
  }
}
