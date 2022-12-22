import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart' as Image;
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:shopx/models/product.dart';

class ProductTile extends StatelessWidget {
  final Products product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: T,
      // color: Colors.greenAccent,
      // shape: ,
      elevation: 5,
      borderOnForeground: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.Image.network(
                    product.image[0].url,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // product.isFavorite.toggle();
                        },
                      ),
                    ))
              ],
            ),
            SizedBox(height: 8),
            Text(
              product.title,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            // if (product.rating != null)
            //   Container(
            //     decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text(
            //           product.rating.toString(),
            //           style: TextStyle(color: Colors.white),
            //         ),
            //         Icon(
            //           Icons.star,
            //           size: 16,
            //           color: Colors.white,
            //         ),
            //       ],
            //     ),
            //   ),
            SizedBox(height: 8),
            Text('\$${product.price}',
                style: TextStyle(fontSize: 32, fontFamily: 'avenir')),
          ],
        ),
      ),
    );
  }
}
