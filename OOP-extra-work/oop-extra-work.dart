void main() {
  //Creating an instance of House
  House myHouse = House("123");
  //Adding trees to the house
  myHouse.addTree(Tree("Pine", 10.3));
  myHouse.addTree(Tree("Apple", 12.3));

  //calling function
  describe(myHouse);
}

void describe(House house) {
  print("This house has address : ${house.address}");
  if (house.trees.isNotEmpty) {
    print("The house has the following trees: ");
    for (var tree in house.trees) {
      print("Tree Type: ${tree.type}, Height: ${tree.height} meters");
    }
  } else {
    print("No Tree");
  }
}

// Class Tree
class Tree {
  String type;
  double height;
  Tree(this.type, this.height);
}

// Class House
class House {
  String address;
  List<Tree> trees = []; // by default empty
  House(this.address);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }
}
