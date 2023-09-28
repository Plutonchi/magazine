import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magazine/page/category/category_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String category = 'Burger';
  final categoryName = [
    'Burger',
    'Pizza',
    'Sandwich',
  ];
  @override
  Widget build(BuildContext context) {
    final Brightness? brightness = MediaQuery.of(context).platformBrightness;

    final Color dropdownBackgroundColor =
        brightness == Brightness.dark ? Color(0xFF181C2E) : Colors.white;
    final Color arrowBack =
        brightness == Brightness.dark ? Color(0xff292939) : Color(0xffECF0F4);
    final Color back =
        brightness == Brightness.dark ? Colors.white : Color(0xff181C2E);
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
              // padding: const EdgeInsets.all(5),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: arrowBack,
              ),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: back,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 18,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                    color: arrowBack, style: BorderStyle.solid, width: 1),
              ),
              width: 150,
              height: 45,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(10),
                  autofocus: true,
                  isExpanded: true,
                  dropdownColor: dropdownBackgroundColor,
                  focusColor: Colors.transparent,
                  iconEnabledColor: Color(0xffF58D1D),
                  items: categoryName
                      .map(
                        (String item) => DropdownMenuItem<String>(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 18,
                            ),
                            child: Text(
                              item,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontFamily: 'SenRegular',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          value: item,
                        ),
                      )
                      .toList(),
                  value: category,
                  onChanged: (String? v) {
                    setState(() {
                      this.category = v!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              width: 61,
            ),
            Container(
              // padding: const EdgeInsets.all(5),
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: arrowBack,
              ),
              child: InkWell(
                onTap: () {
                  print('Search');
                },
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: back,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: arrowBack,
              ),
              child: InkWell(
                onTap: () {
                  print('Filters');
                },
                child: Icon(
                  Icons.filter_list_rounded,
                  size: 25,
                  color: back,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Popular Burgers',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SenRegular',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 21,
                  ),
                  itemCount: 4,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryView(
                      back: back,
                      dropdownBackgroundColor: dropdownBackgroundColor,
                    );
                  }),
              SizedBox(
                height: 32,
              ),
              Text(
                'Open Resturants',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'SenRegular',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 20,
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
