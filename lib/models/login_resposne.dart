class LoginResponse {
  final String email;
  final String authorization;

  LoginResponse({this.email, this.authorization});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      email: json['Email'],
      authorization: json['Authorization'],
    );
  }
}