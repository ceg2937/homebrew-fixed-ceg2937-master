// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver? driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      await driver!.close();
    }
  });

  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {

      final frenchButtonPressed = find.byValueKey('frenchButtonPressed');
      final continueButton = find.byValueKey('continueButton');
      final cupInputField = find.byValueKey('cupInputField');
      final cupContinueButton = find.byValueKey('cupContinueTap');
      final coffeeRecommendation = find.byValueKey('coffeeRecommendation');
      final waterRecommendation = find.byValueKey('waterRecommendation');
      final tapDoneButton = find.byValueKey('tapDoneButton');

      // Steps
      await driver!.tap(frenchButtonPressed);
      await driver!.tap(continueButton);
      await driver!.tap(cupInputField);
      await driver!.enterText("5");
      await driver!.tap(cupContinueButton);

      // Assertions
      expect(await driver!.getText(coffeeRecommendation), '63.0g - course ground coffee');
      expect(await driver!.getText(waterRecommendation), '887g - water');

      await driver!.tap(tapDoneButton);
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //your code here
      final dripMachineButtonPressed = find.byValueKey('dripMachineButtonPressed');
      final continueButton = find.byValueKey('continueButton');
      final cupInputField = find.byValueKey('cupInputField');
      final cupContinueButton = find.byValueKey('cupContinueTap');
      final coffeeRecommendation = find.byValueKey('coffeeRecommendation');
      final waterRecommendation = find.byValueKey('waterRecommendation');
      final tapDoneButton = find.byValueKey('tapDoneButton');

      // Steps
      await driver!.tap(dripMachineButtonPressed);
      await driver!.tap(continueButton);
      await driver!.tap(cupInputField);
      await driver!.enterText("5");
      await driver!.tap(cupContinueButton);

      // Assertions
      expect(await driver!.getText(coffeeRecommendation), '52.0g - medium ground coffee');
      expect(await driver!.getText(waterRecommendation), '887g - water');

      await driver!.tap(tapDoneButton);
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
        //your code here
          final continueButton = find.byValueKey('continueButton');
          final chooseDeviceWidget = find.byValueKey('deviceScreen');

          await driver!.tap(continueButton);
          await driver!.waitFor(chooseDeviceWidget);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final frenchButtonPressed = find.byValueKey('frenchButtonPressed');
      final continueButton = find.byValueKey('continueButton');
      final cupContinueTap = find.byValueKey('cupContinueTap');
      final chooseCupWidget = find.byValueKey('cupScreen');
      final chooseDeviceBack = find.byValueKey('chooseDeviceBack');

      await driver!.tap(frenchButtonPressed);
      await driver!.tap(continueButton);
      await driver!.tap(cupContinueTap);

      await driver!.waitFor(chooseCupWidget);
      await driver!.tap(chooseDeviceBack);

    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here
          final frenchButtonPressed = find.byValueKey('frenchButtonPressed');
          final continueButton = find.byValueKey('continueButton');
          final cupInputField = find.byValueKey('cupInputField');
          final cupContinueButton = find.byValueKey('cupContinueTap');
          final chooseCupWidget = find.byValueKey('cupScreen');
          final chooseDeviceBack = find.byValueKey('chooseDeviceBack');

          // Steps
          await driver!.tap(frenchButtonPressed);
          await driver!.tap(continueButton);
          await driver!.tap(cupInputField);
          await driver!.enterText("-1");
          await driver!.tap(cupContinueButton);

          await driver!.waitFor(chooseCupWidget);
          await driver!.tap(chooseDeviceBack);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      //your code here
      final dripMachineButtonPressed = find.byValueKey('dripMachineButtonPressed');
      final continueButton = find.byValueKey('continueButton');
      final cupContinueButton = find.byValueKey('cupContinueTap');
      final chooseCupWidget = find.byValueKey('cupScreen');
      final chooseDeviceBack = find.byValueKey('chooseDeviceBack');

      await driver!.tap(dripMachineButtonPressed);
      await driver!.tap(continueButton);
      await driver!.tap(cupContinueButton);

      await driver!.waitFor(chooseCupWidget);
      await driver!.tap(chooseDeviceBack);

    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "-1"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with negative cup amount",
        () async {
      //your code here

          final dripMachineButtonPressed = find.byValueKey('dripMachineButtonPressed');
          final continueButton = find.byValueKey('continueButton');
          final cupInputField = find.byValueKey('cupInputField');
          final cupContinueButton = find.byValueKey('cupContinueTap');
          final chooseCupWidget = find.byValueKey('cupScreen');
          final chooseDeviceBack = find.byValueKey('chooseDeviceBack');

          // Steps
          await driver!.tap(dripMachineButtonPressed);
          await driver!.tap(continueButton);
          await driver!.tap(cupInputField);
          await driver!.enterText("-1");
          await driver!.tap(cupContinueButton);
          await driver!.waitFor(chooseCupWidget);
          await driver!.tap(chooseDeviceBack);
    });
  });

  group('Back Button', () {
    //make up your own tests to check that the back button works
    //on every page

    test("Move with French", () async {

      final frenchButtonPressed = find.byValueKey('frenchButtonPressed');
      final continueButton = find.byValueKey('continueButton');
      final cupInputField = find.byValueKey('cupInputField');
      final cupContinueButton = find.byValueKey('cupContinueTap');
      final chooseDeviceBack = find.byValueKey('chooseDeviceBack');
      final chooseCupBack = find.byValueKey('chooseCupBack');


      // Steps
      await driver!.tap(frenchButtonPressed);
      await driver!.tap(continueButton);
      await driver!.tap(cupInputField);
      await driver!.enterText("5");
      await driver!.tap(cupContinueButton);

      await driver!.tap(chooseCupBack);
      await driver!.tap(chooseDeviceBack);
    });

    test("Move with Drip Machine", () async {

      final dripMachineButtonPressed = find.byValueKey('dripMachineButtonPressed');
      final continueButton = find.byValueKey('continueButton');
      final cupInputField = find.byValueKey('cupInputField');
      final cupContinueButton = find.byValueKey('cupContinueTap');
      final chooseDeviceBack = find.byValueKey('chooseDeviceBack');
      final chooseCupBack = find.byValueKey('chooseCupBack');

      // Steps
      await driver!.tap(dripMachineButtonPressed);
      await driver!.tap(continueButton);
      await driver!.tap(cupInputField);
      await driver!.enterText("5");
      await driver!.tap(cupContinueButton);

      await driver!.tap(chooseCupBack);
      await driver!.tap(chooseDeviceBack);
    });
  });
}
