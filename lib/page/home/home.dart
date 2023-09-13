import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location = 'Osh';
  final locationName = [
    'Osh',
    'Bishkek',
    'Talas',
    'Naryn',
    'Jalal-Abad',
    'Chyu',
    'Issik-Kul',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 120,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffecf0f4),
              ),
              child: SvgPicture.asset(
                'assets/svg/menu.svg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DELIVER TO',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'SenRegular',
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFC6E2A),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 135,
                  height: 30,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      focusColor: Colors.transparent,
                      items: locationName
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontFamily: 'SenRegular',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              value: item,
                            ),
                          )
                          .toList(),
                      value: location,
                      onChanged: (String? v) {
                        setState(() {
                          this.location = v!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 90,
            ),
            Container(
              padding: const EdgeInsets.all(14),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFF181C2E),
              ),
              child: SvgPicture.asset(
                'assets/svg/wishlist.svg',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Hey Halal, ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SenRegular',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1E1D1D),
                    ),
                  ),
                  Text(
                    "Good Afternoon!",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SenExtraBold',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E1D1D),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
