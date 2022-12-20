// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget notificationWidget(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(),
    body: SafeArea(
      bottom: true,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    ),
  );
}
