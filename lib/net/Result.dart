class Result {
  static const int SUCCESS_CODE = 100;

  static const int USER_EXIST_CODE = 140;
  static const int USER_NOT_EXIST_CODE = 141;
  static const int USER_PASSWORD_NOT_MATCHED_CODE = 142;

  static const int TOKEN_INVALID_CODE = 200;
  static const int TOKEN_EXPIRED_TIME_CODE = 201;
  static const int TOKEN_UNSUPPORTED_JWT_CODE = 202;

  static const int LOGIN_INVALID_TOKEN_CODE = 250;

  static const int AUTHENTICATION_ERROR_CODE = 300;
  static const int SERVER_ERROR_CODE = 301;
  static const int TOKEN_EMPTY_CODE = 360;

  static const String SUCCESS_MESSAGE = "Success.";
  static const String USER_EXIST_MESSAGE = "User exist";
  static const String USER_NOT_EXIST_MESSAGE = "User is not exist";
  static const String USER_PASSWORD_NOT_MATCHED_MESSAGE = "Password is not matched!";
  static const String TOKEN_INVALID_MESSAGE = "Invalid token information.";
  static const String TOKEN_EXPIRED_TIME_MESSAGE = "This token is expired.";
  static const String TOKEN_UNSUPPORTED_JWT_MESSAGE = "Unsupported token information.";
  static const String LOGIN_INVALID_TOKEN_MESSAGE = "Token information cannot be verified.";
  static const String AUTHENTICATION_ERROR_MESSAGE = "Your authentication information cannot be verified.";
  static const String SERVER_ERROR_MESSAGE = "A system error has occurred. Please contact your administrator.";
  static const String TOKEN_EMPTY_MESSAGE = "Empty token";

  final int code;
  final String message;

  Result(this.code, this.message);

  static Result getResult(int code) {
    switch (code) {
      case SUCCESS_CODE:
        return Result(SUCCESS_CODE, SUCCESS_MESSAGE);
      case USER_EXIST_CODE:
        return Result(USER_EXIST_CODE, USER_EXIST_MESSAGE);
      case USER_NOT_EXIST_CODE:
        return Result(USER_NOT_EXIST_CODE, USER_NOT_EXIST_MESSAGE);
      case USER_PASSWORD_NOT_MATCHED_CODE:
        return Result(USER_PASSWORD_NOT_MATCHED_CODE, USER_PASSWORD_NOT_MATCHED_MESSAGE);
      case TOKEN_INVALID_CODE:
        return Result(TOKEN_INVALID_CODE, TOKEN_INVALID_MESSAGE);
      case TOKEN_EXPIRED_TIME_CODE:
        return Result(TOKEN_EXPIRED_TIME_CODE, TOKEN_EXPIRED_TIME_MESSAGE);
      case TOKEN_UNSUPPORTED_JWT_CODE:
        return Result(TOKEN_UNSUPPORTED_JWT_CODE, TOKEN_UNSUPPORTED_JWT_MESSAGE);
      case LOGIN_INVALID_TOKEN_CODE:
        return Result(LOGIN_INVALID_TOKEN_CODE, LOGIN_INVALID_TOKEN_MESSAGE);
      case AUTHENTICATION_ERROR_CODE:
        return Result(AUTHENTICATION_ERROR_CODE, AUTHENTICATION_ERROR_MESSAGE);
      case SERVER_ERROR_CODE:
        return Result(SERVER_ERROR_CODE, SERVER_ERROR_MESSAGE);
      case TOKEN_EMPTY_CODE:
        return Result(TOKEN_EMPTY_CODE, TOKEN_EMPTY_MESSAGE);
      default:
        return Result(-1, "Unknown error");
    }
  }
}
