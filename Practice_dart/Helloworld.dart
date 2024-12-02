void main() {
  // print('For-loop:');
  // for (int i = 1; i <= 5; i++) {
  //   print(i);
  // }
  // print('While-loop:');
  // int j = 1;
  // while (j <= 5) {
  //   print(j);
  //   j++;
  // }
  // print('Even or Odd Check:');
  // int number = 4; // Change this number to test with different values
  // if (number % 2 == 0) {
  //   print('$number is even.');
  // } else {
  //   print('$number is odd.');
  // }
  // int m = int.parse("100");
  // print(m);
  // dynamic y = 10;
  // print(y);

  // Declare a nullable integer variable and assign it a null value
  int? nullableInt = null;
  print("nullable = $nullableInt");
// Declare a non-nullable integer variable and assign it a value
  int nonNullableInt = 5;
   print("nonnullable = $nonNullableInt");
// Assign a new value to the nullable variable
  nullableInt = 10;
   print("nullable = $nullableInt");
}
