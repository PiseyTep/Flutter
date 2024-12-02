void main(List<String> args) {
  // final m1 = MileToKm();
  // m1.x = 10;
  // print(m1.km());

  final m2 = MileToMeter();
  m2.y = 10;
  print(" ${m2.Meter()}  meters");
}

class MileToKm {
  double x = 0;
  double km(){
    return x* 1.60934;
  }
}
  class MileToMeter extends MileToKm{
    double y = 0  ;
    double Meter(){
      super.x = y;
      return super.km() * 1000 ;
    } 
  }

