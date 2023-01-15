import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ProductController extends GetxController {
  var products;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    initSocket();
    super.onInit();
  }

  IO.Socket? socket;
  initSocket() {
    socket = IO.io('http://10.0.0.202:8000/', <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    socket?.connect();
    socket?.onConnect((_) {
      print('Connection established');
      socket!.emit('msg', 'test');
      socket!.on("checkout", (data) =>fetchProducts());
      socket!.on("connection", (data) => print(data));
      socket!.emit('check', 'hello ');
    });
    socket?.onDisconnect((_) => print('Connection Disconnection'));
    socket?.onConnectError((err) => print(err));

    socket?.onError((err) => print(err));
  }
// socket.on(, (newMessage) {
//   messageList.add(MessageModel.fromJson(data));
// });

  // var product = Products();
  void fetchProducts() async {
    products = <Products>[].obs;
    final url = '${dotenv.env['MAIN_URL']}/products';
    var response = await http.get(Uri.parse(url), headers: Constants().header);
    products.value = productsFromJson(response.body);
    // print(products);
  }
}
