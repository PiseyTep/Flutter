//EX3-filter a list
void main() {
var score = [45,78,62,49,85,33,90,50];
var pass = score.where((score) => score >= 50);
print(pass.toList()); 
 // Print the number of students who passed
  print('After filtering the result ${pass.length} students passed');
}
