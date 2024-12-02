//EX3-Filter a list
void main(List<String> args) {
  List score = [45, 78, 62, 49, 85, 33, 90, 50];
  var pass = (score.where((score) => score >= 50));
  //print the passing score
  print('----------EX3-Filter a list------------\n');
  print('Pass scores: ${pass.toList()}\n');
  //print the number of the student that pass the exam
  print("After filering the result ${pass.length} students passed\n");
  print('----------EX4-Manipulate maps--------------------\n');
}
