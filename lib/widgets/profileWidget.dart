// ignore: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget profile(BuildContext context) {
  // getUser() async {
  //   // print(jwt);
  //   final response = await http.get(
  //     Uri.parse('${dotenv.env['MAIN_URL']}/user?token=$jwt'),
  //   );

  //   // print(jsonDecode(response.body));
  //   if (response.statusCode == 200) {
  //     return user_class.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Error ');
  //   }
  // }

  final size = MediaQuery.of(context).size;
  return Scaffold(
    appBar: AppBar(),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.25,
            color: Colors.blueGrey,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  minRadius: size.width * 0.2,
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              Expanded(
                // flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          // snapshot.data!.name.toString().titleCase,
                          '',
                          style: GoogleFonts.poppins(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          // snapshot.data!.email.toString(),
                          '', style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          StaggeredGrid.count(
            crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    child: const AutoSizeText('s')),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    child: const AutoSizeText('s')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    child: const AutoSizeText('s')),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    child: const AutoSizeText('s')),
              ),
            ],
          ),
          GestureDetector(
              onTap: () {}, child: const Buttons_for_profile_screen()),
          GestureDetector(
              onTap: () {}, child: const Buttons_for_profile_screen()),
          GestureDetector(
              onTap: () {}, child: const Buttons_for_profile_screen()),
          GestureDetector(
              onTap: () {}, child: const Buttons_for_profile_screen()),
        ],
      ),
    ),
  );
}

class Buttons_for_profile_screen extends StatelessWidget {
  const Buttons_for_profile_screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [AutoSizeText('data'), Icon(Icons.forward)],
          ),
        ),
      ),
    );
  }
}
