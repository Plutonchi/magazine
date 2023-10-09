import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  // final item item;
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 321,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff98A8B8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                                print("Back Page");
                              },
                              child: new Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: new Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                              shape: new CircleBorder(),
                              fillColor: Color(0xffffffff),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                print("Added   Favorite");
                              },
                              child: new Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: new Icon(
                                  Icons.favorite_border_outlined,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                              shape: new CircleBorder(),
                              fillColor: Color(0xffffffff),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
