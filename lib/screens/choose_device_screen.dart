import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homebrew/screens/choose_cup_screen.dart';
import 'package:homebrew/utils/colors.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool? isActive;
  String? chooseMachine;

  frenchActive() {
    chooseMachine = 'French';
    isActive = true;
    setState(() {});
  }

  dripMachineActive() {
    chooseMachine = 'Drip Machine';
    isActive = true;
    setState(() {});
  }

  navigateToCupScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChooseCupScreen(machine: chooseMachine!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: Key('deviceScreen'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // texts
            Text(
              "What coffee maker are you using?",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryColor,
                fontSize: 20,
              ),
            ),

            // devices box
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      frenchActive();
                    },
                    key: Key('frenchButtonPressed'),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 16, 20, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'French Press',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(Icons.check,
                              color: chooseMachine == 'French'
                                  ? AppColors.primaryColor
                                  : Colors.transparent),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: AppColors.primaryColor,
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  InkWell(
                    onTap: () {
                      dripMachineActive();
                    },
                    key: Key('dripMachineButtonPressed'),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 16, 20, 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Drip Machine',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(Icons.check,
                              color: chooseMachine == 'Drip Machine'
                                  ? AppColors.primaryColor
                                  : Colors.transparent),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // button
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46.0),
              child: ElevatedButton(
                onPressed: () {
                  if (isActive == true) {
                    navigateToCupScreen();
                  } else {}
                },
                key: Key('continueButton'),
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: isActive == true
                      ? AppColors.primaryColor
                      : AppColors.unActiveColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: isActive == true
                        ? AppColors.whiteColor
                        : AppColors.greyColor,
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
