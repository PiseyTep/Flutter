void main(List<String> args) {
  Roof woodenRoof = Roof("Wooden");
  Chimney brickChimney = Chimney("Brick");
  Door woodenDoor = Door("Wood", "Center", 'Black');
  List<window> windows1 = [
    window("Red", "TopLeft ", "1st"),
    window("Green", "TopRight", "1st"),
    window("Red", "BottomLeft", "ground"),
    window("Red", "BottomRight", "ground")
  ];
//Create My first house
  House house1 = House(woodenRoof, brickChimney, woodenDoor, windows1);
  print("My First House: ");
  house1.describe();
  print('\n----------------------------------------------------\n');

// Creating components for a second house with different windows and roof
  Roof flatRoof = Roof("Flat");
  Chimney stoneChimney = Chimney("Stone");
  List<window> windows2 = [
    window("Blue", "TopLeft", "ground"),
  ];
  ;
  Door metalDoor = Door("Metal", "Right", "Black");

  // Creating the second house
  House house2 = House(flatRoof, stoneChimney, metalDoor, windows2);
  print("My Second House:");
  house2.describe();
  print('\n----------------------------------------------------\n');

// Creating components for a third house with different windows and roof
  Roof squareRoof = Roof("Square");
  Chimney NoChimney = Chimney("No");
  List<window> windows3 = [
    window("Green", "TopLeft", "1st"),
  ];
  ;
  Door GlassDoor = Door("Glass", "Right", "White");

  // Creating the second house
  House house3 = House(squareRoof, NoChimney, GlassDoor, windows3);
  print("My Third House:");
  house3.describe();
  print('\n----------------------------------------------------\n');
}

class window {
  String floor;
  String color;
  String position;

  window(this.color, this.position, this.floor);
}

class Roof {
  String type;
  Roof(this.type);
}

class Door {
  String meterial;
  String color;
  String position;
  Door(this.meterial, this.position, this.color);
}

class Chimney {
  String type;
  Chimney(this.type);
}

class House {
  Roof roof;
  Chimney chimney;
  List<window> windows;
  Door door;

  // Constructor house component
  House(
    this.roof,
    this.chimney,
    this.door,
    this.windows,
  );

  //Function describe the house
  void describe() {
    print(
        "This house has a ${roof.type} roof, ${chimney.type} chimney, and has ${windows.length} windows.");
    for (var window in windows) {
      print(
          "Window Position: ${window.position}, color: ${window.color} at ${window.floor} floor");
    }
    print(
        "The door position ${door.position} and color ${door.color} is made of ${door.meterial}.");
  }
}
