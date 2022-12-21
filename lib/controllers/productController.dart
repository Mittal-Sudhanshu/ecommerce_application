import 'dart:convert';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var products = <Products>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  // var product = Products();
  void fetchProducts() async {
    final url = '${dotenv.env['MAIN_URL']}/products';
    var response = await http.get(Uri.parse(url), headers: Constants().header);
    if (response.statusCode == 200) {
      products.value = productsFromJson(response.body);

      // print(products);
      // print(jsonDecode(response.body)[1]);
    }
  }
}
