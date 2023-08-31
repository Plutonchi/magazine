import 'package:flutter/material.dart';
import 'package:magazine/page/home/home.dart';
import 'package:magazine/utils/app_colors/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationAccess extends StatelessWidget {
  const LocationAccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 206,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Color(0xFF98A8B8)),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                height: 62,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      backgroundColor: AppColors.colorF7),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ACCESS LOCATION",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "SenRegular",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white24,
                          ),
                          child: Container(
                            child: SvgPicture.asset(
                              'assets/svg/map-pin.svg',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 37,
                  ),
                  Text(
                    "DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'SenRegular',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF646982),
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
