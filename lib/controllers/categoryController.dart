import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/category_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var category = <Category>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getCategory();
    super.onInit();
  }

  getCategory() async {
    final url = '${dotenv.env["MAIN_URL"]}/category';
    var response = await http.get(Uri.parse(url), headers: Constants().header);
    category.value = categoryFromJson(response.body);
  }
}
