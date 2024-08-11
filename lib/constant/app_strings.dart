class StringsManager {
  static const String lang = 'en';
  static String token = '';
  static const String noRouteFound = 'no screen Found';
  static const String serverFailureMsg = 'Please try again later .';
  static const String serverExceptionMsg = 'Server Exception data invalid .';
  static const String offLineFailureMsg =
      'Please Check your Internet Connection';
  static const String emptyCacheFailureMsg = 'No Data';
  static const String unexpectedFailureMsg =
      'Unexpected Error, Please try again later';
  static const String loginSuccessMsg = 'Login successfully';
  static const String registerSuccessMsg = 'Register successfully';
  static const String passwordNotMatchMsg = 'Password Not Match';
  static const String badCredentialsMsg = 'Email or password wrong';
  static const String nationalIdMsg =
      "could not execute statement; SQL [n/a]; constraint [users.index_nationalId]; nested exception is org.hibernate.exception.ConstraintViolationException: could not execute statement";
  static const String ourToken = "Basic ZGV2Lm1yZEBxZmx5LmNvOkRldkA3OA==";

  static const String contentType = 'application/json';

  static List<String> classTypeList = ClassType.values
      .map(
        (e) => e.toString().split('.').last,
      )
      .toList();
}

enum ClassType {
  economy,
  secondClass,
  firstClass,
}
