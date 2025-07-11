class Password {
  String _password = "";

  Password({required String password}) {
    _password = password;
  }

  bool isValid() {
    return _password.length >= 8 && 
           _password.length <= 16 && 
           _password.contains(RegExp(r'[0-9]'));
  }

  @override
  String toString() {
    return "Your Password is: $_password";
  }
}