class Password {
  String password = "";

  bool isValid() {
    return password.length >= 8 && password.length <= 16;
  }

  @override
  String toString() {
    return "Your Password is: $password";
  }
}