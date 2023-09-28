import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magazine/page/page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var allItems = List.generate(50, (index) => 'item $index');
  var items = [];
  var searHistory = [];
  final TextEditingController searchController = TextEditingController();
  final SearchController controller = SearchController();
  @override
  void initState() {
    searchController.addListener(queryListener);
  }

  @override
  void dispose() {
    searchController.removeListener(queryListener);
    searchController.dispose();
    controller.removeListener(searchListener);
    controller.dispose();
    super.dispose();
  }

  void queryListener() {
    search(searchController.text);
  }

  void searchListener() {
    search(controller.text);
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        items = allItems;
      });
    } else {
      setState(() {
        items = allItems
            .where(
              (e) => e.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
      });
    }
  }

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
  List<Map> categories = [
    {'name': 'All', 'iconPath': 'assets/images/apple.png'},
  ];
  @override
  Widget build(BuildContext context) {
    final Brightness? brightness = MediaQuery.of(context).platformBrightness;

    final Color dropdownBackgroundColor =
        brightness == Brightness.dark ? Color(0xFF181C2E) : Colors.white;
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
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: dropdownBackgroundColor,
                      isExpanded: true,
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
              SearchAnchor(
                searchController: controller,
                viewHintText: 'Search...',
                viewTrailing: [
                  IconButton(
                    onPressed: () {
                      searHistory.add(controller.text);
                      searHistory = searHistory.reversed.toSet().toList();
                      controller.closeView(controller.text);
                    },
                    icon: Icon(Icons.search),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.clear();
                    },
                    icon: Icon(Icons.clear),
                  ),
                ],
                builder: (context, controller) {
                  return SearchBar(
                    controller: controller,
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
                    onTap: () {
                      controller
                          .openView(); // The code below only works with SearchAnchor
                    },
                  );
                },
                suggestionsBuilder: (context, controller) {
                  return [
                    Wrap(
                      children: List.generate(searHistory.length, (index) {
                        final item = searHistory[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: ChoiceChip(
                              label: Text(item),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                              onSelected: (v) {
                                search(item);
                                controller.closeView(item);
                              },
                              selected: item == controller.text),
                        );
                      }),
                    ),
                    if (controller.text.isNotEmpty) ...[
                      const Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Card(
                            child: Column(
                              children: [
                                Text('Name : $item'),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(item),
                              ],
                            ),
                          );
                        },
                      )
                    ]
                  ];
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
                      return InkWell(
                        onTap: () {
                          print('Category');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                height: 122,
                                width: 122,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
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
                primary: false,
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
                        SizedBox(
                          height: 20,
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
