// ignore_for_file: file_names, unused_local_variable

import 'dart:convert';

// import 'package:ecommerce/BLoC/search_bloc.dart';
import 'package:ecommerce/widgets/homeWidget.dart';
import 'package:ecommerce/widgets/menuWidget.dart';
import 'package:ecommerce/widgets/profileWidget.dart';
import 'package:ecommerce/widgets/wishlist.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// String? token;
// final String url = "https://web-production-cec4.up.railway.app/detect";
// var received;

class _HomeState extends State<Home> {
//   getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       token = prefs.getString('token');
//     });
//   }

  int _selectedIndex = 0;
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    // getToken();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_2ytPPfpgQ4ygO1',
      'amount': 1,
      'name': 'Test',
      'description': 'Test',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': '6387202859',
        'email': 'sudhanshu.mittal.49@gmail.com'
      },
      'external': {
        'wallets': ['phonepe']
      }
    };

    try {
      // _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    if (kDebugMode) {
      print('Success Response: ${response.paymentId}');
    }
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (kDebugMode) {
      print('Error Response: ${response.message}');
    }
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    if (kDebugMode) {
      print('External SDK Response: ${response.walletName}');
    }
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  @override
  Widget build(BuildContext context) {
    var widgets = [
      buildHome(context),
      wishlistWidget(context),
      notificationWidget(context),
      profile(
        context,
      ),
    ];
    var size = MediaQuery.of(context).size;
    // final searchBloc = Provider.of<SearchBloc>(context, listen: true);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: widgets[_selectedIndex],
    );
  }
}
