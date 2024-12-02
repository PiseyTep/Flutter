class PassClass {
  String _hashPass = ""; //Private

  set password(String value) {
    _hashPass = "***" + value + "****";
  }

  get hasPassword => _hashPass;
}
