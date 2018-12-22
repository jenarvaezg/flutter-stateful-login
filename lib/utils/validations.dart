String validateEmail(String value) {
    final emailValid =
        RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return emailValid ? null : "Invalid email address";
  }

String validatePassword(String value) {
  return value.length >= 8 ? null : "Password must have at least 8 characters";
}