void main() {
  Distance d1 = Distance.kms(1); //convert to meters
  Distance d2 = Distance.meters(1000);

  //print
  print("kilometers = ${d1.kms} kms");
  print("kilometers =${d1.meters} meters");
  print("kilometers = ${d1.cms} cms");
  print("\n--------------------------------------\n");

  print("Centimeters = ${d2.cms} cms");
  print("Centimeters = ${d2.meters} meters");
  print("Centimeters = ${d2.kms} kilometers");

  print("\n--------------------------------------\n");
  print("Result is: ${(d1 + d2).kms} kms");
  print("Result is: ${(d1 + d2).meters} meters");
  print("Result is: ${(d1 + d2).cms} cms");
}

class Distance {
  final double _meters;

  Distance.meters(double meters) : _meters = meters;
  Distance.kms(double kms) : _meters = kms * 1000;
  Distance.cms(double cms) : _meters = cms / 100;
  //getter
  double get meters => _meters;
  double get kms => _meters / 1000;
  double get cms => _meters * 100;

  Distance operator +(Distance other) {
    return Distance.meters(this.meters + other.meters);
  }
}
