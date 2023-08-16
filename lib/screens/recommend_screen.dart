import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';

import '../utils/colors.dart';

class RecommendScreen extends StatefulWidget {
  final String machine;
  final int cupNum;

  const RecommendScreen(
      {super.key, required this.machine, required this.cupNum,});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {

  double oneCup = 177.42;
  double? cupGramVal;

  // go back
  navigateToBack() {
    Navigator.of(context).pop();
  }

  //
  coffeeReturn() {
    if(widget.machine == 'French') {
      return 'course ground coffee';
    } else {
      return 'medium ground coffee';
    }
  }

  //
  coffeeGram() {
    if(widget.machine == 'French') {
      cupGramVal = ((widget.cupNum / 14) * oneCup);
      return cupGramVal;
    } else {
      cupGramVal = ((widget.cupNum  / 17) * oneCup);
      return cupGramVal;
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coffeeGram();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('recommendScreen'),

      // appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            navigateToBack();
          },
          key: Key('chooseCupBack'),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ),

      // body
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            SizedBox(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryColor,
                      fontFamily: 'Kollektif',
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    '${cupGramVal!.roundToDouble()}g - ${coffeeReturn()}',
                    key: Key('coffeeRecommendation'),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Kollektif',
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '887g - water',
                    key: Key('waterRecommendation'),
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Kollektif',
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Enjoy your delicious coffee.',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(),
            Padding(
              padding:
              const EdgeInsets.only(left: 46.0, right: 46.0, bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseDeviceScreen(),
                      ),
                          (route) => false);
                },
                key: Key('tapDoneButton'),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
