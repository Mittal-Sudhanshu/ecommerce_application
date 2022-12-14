import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../BLoC/search_bloc.dart';

Widget buildHome( BuildContext context) {
  final size = MediaQuery.of(context).size;
  final searchBloc = Provider.of<SearchBloc>(context, listen: true);
  return CustomScrollView(
    slivers: [
      SliverAppBar(
        floating: true,
        pinned: true,
        snap: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        bottom: AppBar(
          title: Row(
            children: [
              SizedBox(
                width: size.width * .8,
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search for something',
                      prefixIcon: Icon(Icons.search),
                      // suffixIcon: Icon(Icons.camera_alt)
                    ),
                    onChanged: (value) {
                      searchBloc.changeSearchText(value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    searchBloc.search();
                    // searchBloc.changeSearchText(null);
                  },
                  child: Icon(Icons.search),
                ),
              )
            ],
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [],
        ),
      )
    ],
  );
}
