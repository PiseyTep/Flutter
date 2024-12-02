enum Skill { FLUTTER, DART, PHP, JAVA, JAVASCRIPT, C, CPP }

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _Experience;

  // Constructor
  Employee({
    required String name,
    required double baseSalary,
    required List<Skill> skills,
    required Address address,
    required int Experience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = skills,
        _address = address,
        _Experience = Experience;

  
  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int Experience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = [Skill.FLUTTER, Skill.DART],
        _address = address,
        _Experience = Experience;

  Employee.WebDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int Experience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = [Skill.PHP, Skill.JAVASCRIPT],
        _address = address,
        _Experience = Experience;

  // Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _Experience;

  double FinalSalary() {
    double salary = _baseSalary;

    salary += _Experience * 2000;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.PHP:
          salary += 1000;
          break;
        case Skill.JAVA:
          salary += 500;
          break;
        case Skill.JAVASCRIPT:
          salary += 300;
          break;
        case Skill.C:
          salary += 500;
          break;
        case Skill.CPP:
          salary += 700;
          break;
      }
    }
    return salary;
  }

  @override
  String toString() {
    return ' Employee: $_name, \n Address: $_address\n Skill: ${skills} \n BaseSalary: \$$_baseSalary \n Experience: $_Experience years \n Final Salary: \$${FinalSalary()}';
  }
}

class Address {
  final String street;
  final String city;
  final String zipCode;
  Address({required this.street, required this.city, required this.zipCode});

  @override
  String toString() {
    return '$street, $city, $zipCode';
  }
}
void main() {
  Address address = Address(street: "102", city: "Phnom Penh", zipCode: "885");

  Employee employee = Employee(
    name: "Tip Dalin",
    baseSalary: 3000,
    skills: [Skill.C, Skill.PHP],
    address: address,
    Experience: 2,
  );
  Employee mobileDeveloper = Employee.mobileDeveloper(
    name: "Park Rosie",
    baseSalary: 1000,
    address: address,
    Experience: 1,
  );
  Employee WebDeveloper = Employee.WebDeveloper(
    name: "Jennie",
    baseSalary: 2000,
    address: address,
    Experience: 5,
  );
  print("List of each Skill Bonus:");
  print("1.Flutter +\$5000");
  print("2.DART +\$3000");
  print("3.PHP +\$1000");
  print("4.JAVA +\$500");
  print("5.JAVASCRIPT +\$300");
  print("6.C +\$500");
  print("7.C++ +\$7000");
  print("Each year of experience adds \$2000");
  print("\n-------------------------------\n");
  print(employee);
  print("\n-------------------------------\n");
  print(mobileDeveloper);
  print("\n-------------------------------\n");
  print(WebDeveloper);
  print("\n-------------------------------\n");
}
