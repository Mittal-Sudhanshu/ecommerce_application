import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget menu(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(),
    body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        )),
  );
}
