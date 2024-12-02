void main(List<String> args) {
  Student s1 = new Student();
  print(s1.id);
  print(s1.name);
  print(s1.score);
  print(s1.passed());
}
class Student {
  late int id;
  late String name;
  late double score;
  //Constructor
  // Student(int id, String name, double score) {
  //   this.id = id;
  //   this.name = name;
  //   this.score = score;
  // }
  Student({this.id = 0, this.name = 'me', this.score = 78.9});
  Student.fromMap(Map map) {
    //name constructor
    this.id = map['id'];
    this.name = map['name'];
    this.score = map['score'];
  }
  bool passed() {
    if (score >= 50) return true;
    return false;
  }
}
