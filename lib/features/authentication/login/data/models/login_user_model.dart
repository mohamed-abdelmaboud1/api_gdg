class LoginRequestModel {
  final String email;
  final String password;
  LoginRequestModel({
    required this.email,
    required this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
  //copyWith method
  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) {
    return LoginRequestModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
class ResponseUserModel {
  final String name;

  ResponseUserModel({required this.name});

  factory ResponseUserModel.fromJson(Map<String, dynamic> json) {
    return ResponseUserModel(
      name: json['name'],
    );
  }
}