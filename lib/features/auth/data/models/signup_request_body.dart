class AuthRequestBody {
  final String email;
  final String password;

  AuthRequestBody({required this.email, required this.password});

  factory AuthRequestBody.fromJson(Map<String, dynamic> json) {
    return AuthRequestBody(email: json['email'], password: json['password']);
  }
}
