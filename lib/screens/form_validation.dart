validateFullName(value) {
  if (value == null || value.isEmpty) {
    return "Please Enter Your Name";
  }
  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
    return "Full name should be the alphabets only";
  }
  return null;
}

validateEmail(value) {
  if (value.isEmpty) {
    return 'Please enter your email address.';
  }
  if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value)) {
    return 'Email should be in a proper format';


  }
  return null;
}

validatePassword(value) {
  if (value.isEmpty) {
    return 'Please enter a password.';
  }
  if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(value)) {
    return 'Password should be eight characters long and combination one uppercase, one lowercase, one digit and one special character.';
  }
  return null;
}




var email = RegExp(
    (r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"));

var capital = RegExp((r'^(?=.*?[A-Z])'));
var small = RegExp((r'^(?=.*?[a-z])'));
var specialChar = RegExp((r'(?=.*?[!@#\$&*~])'));
var number = RegExp((r'^(?=.*?[0-9])'));
var maxLength = RegExp((r'^.{8,}'));
isEmptyValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter contact name';
  }
  return null;
}

domainValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Please enter domain.';
  } else if (value.toLowerCase().endsWith('.')) {
    return 'Please enter a valid domain';
  }
  return null;
}
