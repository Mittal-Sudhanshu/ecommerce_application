import 'package:get_storage/get_storage.dart';

class Constants {
  // box.write(key, value)
  //  token = box.read('token');
  // print(box.read('token'));
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  Map<String, String> authHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${GetStorage().read('token')}'
  };
}
