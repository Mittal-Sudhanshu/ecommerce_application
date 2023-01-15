import 'package:ecommerce/widgets/productTile.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class OutOfStock extends StatelessWidget {
  final Products product;
  const OutOfStock(this.product);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, alignment: Alignment.center, children: [
      Center(
        child: Container(
          color: Colors.grey,
          child: Text('Out of Stock'),
        ),
      ),
      ProductTile(product)
    ]);
  }
}
