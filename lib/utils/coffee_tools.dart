class CoffeeTools {
  static final CoffeeTools _instance = CoffeeTools._internal();

  factory CoffeeTools() {
    return _instance;
  }

  CoffeeTools._internal();

  String? chooseDevice;
  int? cupNumber;
  double? cupGramVal;

  double oneCup = 177.42;


  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup
  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  //
  deviceSelected(String device) {
    chooseDevice = device;
    print(chooseDevice);
  }

  //
  enteredCup(int cupNum) {
    cupNumber = cupNum;
    print(cupNumber);
  }

  //
  coffeeReturn() {
    if(chooseDevice == 'French') {
      return 'course ground coffee';
    } else {
      return 'medium ground coffee';
    }
  }

  //
  coffeeGram() {
    if (cupNumber == null) {
      throw ArgumentError("cupNumber is not set.");
    }
    if(chooseDevice == 'French') {
      cupGramVal = ((cupNumber! / 14) * oneCup);
      return cupGramVal;
    } else {
      cupGramVal = ((cupNumber! / 17) * oneCup);
      return cupGramVal;
    }
  }


}
