// ignore: file_names
// ignore_for_file: prefer_typing_uninitialized_variables, file_names, duplicate_ignore

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.image, required this.text})
      : super(key: key);
  final image;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 7,
        borderRadius: BorderRadius.circular(200),
        child: SizedBox(
          height: 65,
          width: 90,
          // decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20),),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Image.network(
                    image,
                    // scale: 15,
                  ),
                ),
                Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}