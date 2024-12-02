//import 'pass_class.dart';

void main(List<String> args) {
  final pc = PassClass();
  pc._hashPass = 'Hello';
  pc.password = 'dalin'; //setter
  //String pass = pc.password; //not getter
  String hash = pc.hasPassword; //getter
  print(hash);
}

class PassClass {
  String _hashPass = ""; //Private

  set password(String value) {
    _hashPass = "***" + value + "****";
  }

  get hasPassword => _hashPass;
}
