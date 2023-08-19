import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          color: Colors.white,
          width: 200,
        ),
        actions: [
          InkWell(
            onTap: () {
              print("Wishlist");
            },
            child: Image.asset(
              'assets/images/Vector.png',
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text(
                'Explore',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
