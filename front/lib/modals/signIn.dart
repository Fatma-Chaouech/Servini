

class SignInResponse {
  final String token;

  SignInResponse({required this.token});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      token: json["jwt"]??"",
    );
  }
}

class SignInRequest {
  String email="";
  String password="";

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };

    return map;
  }
}

