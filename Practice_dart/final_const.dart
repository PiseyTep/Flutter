void main() {
  //1 iLike
  const ilike = 'I like pizza';
  print(ilike);

  //2 topping 
  //Final can't reassigned the value of variable;
  var toppings = 'With tomatoes';
  toppings += " and cheese";
  print(toppings);

  //3 message
  final message = '$ilike $toppings';
  print(message);

  //4 rgbcolor Because this variable never changes
  const List<String> rgbColors = ['red', 'blue', 'green'];
  print(rgbColors);

  //5 weekDays Because this variable adds the value during compile time.
  //Const runtime error
  final List<String> weekDays = ['monday', 'Tuesday', 'Wednesday'];
  weekDays.add('Thursday');
  print(weekDays);

  //6 score //Variable assigned 2 times
  List<int> score = [45, 35, 50];
  score = [45, 35, 50, 78];
  print(score);
}
