import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({
    super.key,
    required this.dropdownBackgroundColor,
    required this.back,
  });

  final Color dropdownBackgroundColor;
  final Color back;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
          ),
          width: 150,
          height: 150,
        ),
        Positioned(
          top: 90,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Burger Bistro",
                style: TextStyle(
                  fontFamily: 'SenRegular',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Rose garden",
                style: TextStyle(
                  fontFamily: 'SenRegular',
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Text(
                    '\$ 40',
                    style: TextStyle(
                      fontFamily: 'SenRegular',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      print("Added");
                    },
                    child: new Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: new Icon(
                        Icons.add,
                        color: back,
                      ),
                    ),
                    shape: new CircleBorder(),
                    fillColor: Color(0xffF58D1D),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            // color: Color(0xff98A8B8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.asset(
            'assets/images/apple.png',
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          width: 122,
          height: 84,
        ),
      ],
    );
  }
}
