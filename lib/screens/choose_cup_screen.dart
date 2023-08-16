import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homebrew/screens/recommend_screen.dart';
import 'package:homebrew/utils/colors.dart';

class ChooseCupScreen extends StatefulWidget {
  final String machine;
  const ChooseCupScreen({super.key, required this.machine});

  @override
  State<ChooseCupScreen> createState() => _ChooseCupScreenState();
}

class _ChooseCupScreenState extends State<ChooseCupScreen> {
  navigateToBack() {
    Navigator.of(context).pop();
  }

  navigateToRecommendScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecommendScreen(machine: widget.machine, cupNum: int.parse(_controller.text),),
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();
  bool _isFieldEmpty = true;
  bool _isNegative = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        _isFieldEmpty = _controller.text.isEmpty;
        _isNegative = (double.tryParse(_controller.text) ?? 0.0) < 0;

      });
    });
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Always dispose of your TextEditingController when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('cupScreen'),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            navigateToBack();
          },
          key: Key('chooseDeviceBack'),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primaryColor,
            size: 20,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // texts
            Text(
              "How many cups would you like?",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
                fontSize: 20,
              ),
            ),

            // field
            SizedBox(height: 24),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: TextFormField(
                controller: _controller,
                key: Key('cupInputField'),
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                  fontSize: 16,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 16, bottom: 6),
                ),
              ),
            ),

            // button
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46.0),
              child: ElevatedButton(
                onPressed: () {
                  if(_isFieldEmpty == false && _isNegative == false ) {
                    navigateToRecommendScreen();
                  } else {

                  }
                },
                key: Key('cupContinueTap'),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: _isFieldEmpty == true
                      ? AppColors.unActiveColor
                      : AppColors.primaryColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: _isFieldEmpty == true
                        ? AppColors.greyColor
                        : AppColors.whiteColor,
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
