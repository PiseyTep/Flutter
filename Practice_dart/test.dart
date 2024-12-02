void main() {
  // Declare a nullable integer variable and assign it a null value
  int? nullableInt = null;
  String? nullsrtring = '';
  print("String = $nullsrtring");
  print("nullable = $nullableInt");
// Declare a non-nullable integer variable and assign it a value
  int nonNullableInt = 5;
  print("nonnullable = $nonNullableInt");
// Assign a new value to the nullable variable
  nullableInt = 10;
  print("nullable = $nullableInt");

  final currentDateTime = DateTime.now();
  print(currentDateTime);

  const num = 3;
  print(num);

  Map<String, int> scoreMap = {
    'Math': 90,
    'Science': 85,
  };
  print("math: ${scoreMap['Math']}");
  scoreMap['English'] = 88;
  print(scoreMap);
  int square(int number) => number * number;
// Call the arrow function and print the result
  print('Square of 4: ${square(4)}');
  const company = {
    'HR': {'employees': 5, 'budget': 20000},
    'IT': {'employees': 10, 'budget': 50000},
    'Marketing': {'employees': 7, 'budget': 30000},
  };
  print(company);
  const coordinates = [
    [1, 2],
    [3, 4],
    [5, 6],
  ];
  print(coordinates);

  const productDetails = {
    'id': 101,
    'name': 'Laptop',
    'price': 999.99,
    'inStock': true,
  };
  print(productDetails);


  // const operations = [
  //   (int a, int b) => a + b,
  //   (int a, int b) => a - b,
  //   (int a, int b) => a * b,
  // ];
  // print(operations);

  // const distances = {3.1, 5.5, 10.2, 7.8};
  // print(distances);

  const university = {
    'departments': [
      {
        'name': 'Computer Science',
        'students': [
          {'name': 'Alice', 'age': 22},
          {'name': 'Bob', 'age': 24},
        ]
      },
      {
        'name': 'Mathematics',
        'students': [
          {'name': 'Charlie', 'age': 21},
          {'name': 'Dave', 'age': 23},
        ]
      }
    ]
  };
  print(university);

  
}
