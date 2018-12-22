import '../utils/validations.dart' as validations;

class ValidationMixin {
  
  String validateEmail(String value) => validations.validateEmail(value);

  String validatePassword(String value) => validations.validateEmail(value);

  
}
