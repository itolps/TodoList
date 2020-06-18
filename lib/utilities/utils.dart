class Utils {
  static String validateName(String value) {
    if (value.length < 4)
      return 'O nome deve ter mais de 3 caracteres';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value.length < 3)
      return 'A senha deve ter mais de 2 caracteres';
    else
      return null;
  }
}
