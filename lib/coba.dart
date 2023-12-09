import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleUserPage extends StatefulWidget {
  const ArticleUserPage({super.key});

  @override
  State<ArticleUserPage> createState() => _ArticleUserPageState();
}

class _ArticleUserPageState extends State<ArticleUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(54, 238, 238, 220),
                  Color.fromARGB(174, 222, 229, 210),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                height: 120,
                width: 300,
                color: Colors.yellow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                              "Meningkatkan Produktifitas Tanaman dengan Teknologi Pertanian terbaru")
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Cek Artikel Lengkap"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              iconSize: 15,
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Color.fromARGB(255, 120, 62, 25),
                              ),
                            ),
                            Text(
                              "200",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 11,
                              ),
                            ),
                            IconButton(
                              padding: EdgeInsets.all(0),

                              onPressed: () {},
                              icon: Icon(
                                Icons.energy_savings_leaf,
                                color: Color.fromARGB(255, 79, 125, 67),
                                size: 15,
                              ),
                            ),
                            Text(
                              "150",
                              style: TextStyle(
                                fontFamily: "Lato",
                                fontSize: 11,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
