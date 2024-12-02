void main(List<String> args) {
//EX4- Manipulate maps
//Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };
//List of ordered pizzas
  const order = [
    'margherita',
    'pepperoni',
  ];
//Find the total throught the order
  double total = 0;
  for (var pizza in order) {
//Check if the pizza is in the menu
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!; //Add the pizza price to total
    } else {
      //print out the message if the pizza is not in the menu
      print(' $pizza pizza is not in the menu');
      return;
    }
  }
  //print the total price
  print('Total: \$${total}');
}
