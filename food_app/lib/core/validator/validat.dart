class Validat {
  static String? isEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    ).hasMatch(value)) {
      return "Invalid email";
    }

    return null;
  }

  static String? isPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
    ).hasMatch(value)) {
      return "Password must contain uppercase, lowercase, number and be at least 8 characters";
    }

    return null;
  }

  static String? isName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }

    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
      return "Invalid name";
    }

    return null;
  }
}