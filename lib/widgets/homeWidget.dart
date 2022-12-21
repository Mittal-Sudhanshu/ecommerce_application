// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/controllers/productController.dart';
import 'package:ecommerce/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

final ProductController productController = Get.put(ProductController());
Widget buildHome(BuildContext context) {
  final size = MediaQuery.of(context).size;
  // final searchBloc = Provider.of<SearchBloc>(context, listen: true);
  return SafeArea(
    // child: SingleChildScrollView(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Welcome Back!',
                        style: GoogleFonts.poppins(),
                      ),
                      AutoSizeText(
                        'Falcon Thought',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Material(
                // elevation: 20,
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        // label: Row(children: [],),
                        icon: Icon(Icons.search),
                        hintText: 'Search for something',
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                // elevation: 20,
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100,
                child: SizedBox(
                  height: 150,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const AutoSizeText('Shop With Us!'),
                              AutoSizeText(
                                '''Get 40% Off for\nall items''',
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold),
                              ),
                              AutoSizeText(
                                'Shop Now ->',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/logo.png'),
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(
                height: 30,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Material(
                      // color:,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          // color: Colors.grey.shade100,
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('dataaaaa'),
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: productController.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // maxCrossAxisExtent: 200,
                    crossAxisCount: 2,
                    // childAspectRatio: 1,
                    // crossAxisSpacing: 20,
                    // mainAxisExtent: 200

                    // maxCrossAxisExtent: ,
                  ),
                  itemBuilder: (context, index) =>
                      Obx(() => ProductTile(productController.products[index])),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
//  GestureDetector(
//                             onTap: () {},
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.bottomCenter,
//                                 children: [
//                                   Stack(
//                                     alignment: Alignment.topRight,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                           // shape: ,
//                                           borderRadius:
//                                               BorderRadius.circular(20),
//                                           image: const DecorationImage(
//                                             fit: BoxFit.fill,
//                                             image: NetworkImage(
//                                               'https://rukminim1.flixcart.com/image/832/832/xif0q/kurta/p/g/0/-original-imagh3femsugzfgn.jpeg?q=70',
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       IconButton(
//                                           onPressed: () {},
//                                           icon: const Icon(
//                                             Icons.headphones,
//                                             // color: Colors.amber,
//                                           )),
//                                     ],
//                                   ),
//                                   IconButton(
//                                       onPressed: () {},
//                                       icon: const Icon(
//                                         Icons.shopping_bag,
//                                         // color: Colors.black,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           )