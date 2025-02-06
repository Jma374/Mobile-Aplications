// comments
//variables and adat types
//control flows and lopping
//void creates a function which does not return a value
//main() name of fucntion (reserved for dart)
// {code to be executed when the function runs}

void main() {
  // call the funtion
  greeting();
  print(addTwo(100));

  int result = addTwo(30);
  print(result);

  var inferredString = "Juan";

  String explicitstring = "Juan";

  print(inferredString + " " + explicitstring);

  //null safety
  int? someNumber;
  print(someNumber);
  someNumber = 12;
  print(someNumber);

  //late keyboard
  late int willBeNumber;
  //
  int? goals;
//control the flow of the program to avoid error
  if (goals != null) {
    print(goals + 2);
  } else {
    print('the variable goals is null');
  }

  // built in data types
//numeric
  int age = 21;
  num count = 3;
  double temp = 29.9;
//Booleans (true or false)
  bool isReady = false;
//collections: lists, arrays and maps
//strings for expressing text
  String school = "university of miami";

// using placeholders to insert variables inside strings
  print("my school is $school");

  //Built-in types operations
  print("my school name has ${school.length} characters ");

  if (school.length > 20) {
    print("This name is really long");
  } else {
    print("your school has short name");
  }
  // control operators
  // > greater than
  // < less than
  // >= greater than or equal
  // < less than or equal
  // == equals (comparing two items
  // != not equal
  // % modulus

  // arithmetic operators
  // +
  // -
  // * multiplication
  //  / division
  // % modulus

  // Math shortcuts
  int X = 10;
  X = X + 5; //15
  // same as
  X += 5; //20 -= *= /=
  // ! the opposite of an expression
  bool isHere = false; //!isHere
// || at least one condition must be true
  if (!isHere && (school.length < 10)) {
    // do some code
  }

//while loop
  int counter = 0;
  while (counter < 2) {
    print(counter);
    counter++;
  }
// and operator all conditions must be true

  do {
    print(counter);
    counter++;
  } while (counter < 20);
}
// variable declarations
// type of variable/ name = value;
//dynamic types
//var identifier/ name = value;

//custom funcitons
void greeting() {
  print("hello");
}

// operation with options or parameters
int addTwo(int number) {
  return number + 2;
}
