class UserResponse {
  final bool requestStatus;
  final String error;
  final String email;
  final String password;

  UserResponse({
    this.error,
    this.requestStatus,
    this.email,
    this.password,
  });

  UserResponse.fromApi(Map<String, dynamic> map)
      : requestStatus = map['status'],
        error = map['error'],
        email = map['email'],
        password = map['password'];
}
