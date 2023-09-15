import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final focusNode = FocusNode();
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
    List<Map> categories = [
      {'name': 'All', 'iconPath': 'assets/images/apple.png'},
      {'name': 'My', 'iconPath': 'assets/images/apple.png'},
      {'name': 'Anxious', 'iconPath': 'assets/images/apple.png'},
      {'name': 'Kids', 'iconPath': 'assets/images/apple.png'},
      {'name': 'Sleep', 'iconPath': 'assets/images/apple.png'},
      {'name': 'All', 'iconPath': 'assets/images/apple.png'},
      {'name': 'My', 'iconPath': 'assets/images/apple.png'},
      {'name': 'Anxious', 'iconPath': 'assets/images/apple.png'},
      {'name': 'Kids', 'iconPath': 'assets/images/apple.png'},
      {'name': 'Sleep', 'iconPath': 'assets/images/apple.png'},
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
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
          padding: const EdgeInsets.all(24),
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
                    ),
                  ),
                  Text(
                    "Good Afternoon!",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SenExtraBold',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              SearchBar(
                focusNode: focusNode,
                elevation: MaterialStateProperty.all(1),
                hintText: 'Search product',
                hintStyle: MaterialStateProperty.all(
                    const TextStyle(color: Colors.grey)),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                    fontFamily: 'SenRegular',
                    color: Color(0xFF1E1D1D),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xFFF6F6F6),
                ),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                leading: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                onChanged: (String value) {
                  print('value: $value');
                },
                onTap: () {
                  print(
                      'tapped'); // The code below only works with SearchAnchor
                  // _searchController.openView();
                },
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SenRegular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('See all');
                    },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'SenRegular',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              height: 122,
                              width: 122,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset(
                                categories[index]['iconPath'],
                                height: 81,
                                width: 96,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              categories[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'SenRegular',
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Open Restaurants',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SenRegular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('See all');
                    },
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'SenRegular',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 137,
                          decoration: BoxDecoration(
                            color: Color(0xFFC4C4C4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        // Image.asset(
                        //   'assets/images/onboarding/1.png',
                        //   width: 332,
                        //   height: 214,
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'rose garden restauran'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'SenRegular',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "Burger - Chiken - Riche - Wings ",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'SenRegular',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFA0A5BA),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star_border_sharp,
                                  color: Color(0xFFFF7622),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '4.7',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SenRegular',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.delivery_dining_sharp,
                                  color: Color(0xFFFF7622),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  'Free',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SenRegular',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: Color(0xFFFF7622),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '20 min',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'SenRegular',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
