import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:servini_app/modals/signIn.dart';
import 'package:servini_app/modals/signUp.dart';
import '../constants/routes.dart';
import '../modals/signIn.dart';
import '../modals/signUp.dart';

class APIService {


  Future<SignUpResponse> register(SignUpRequest requestModel) async {

    final response = await http.post(Uri.parse('$API_URL/auth/register'), body: requestModel.toJson());
    if (response.statusCode == 201 || response.statusCode == 400) {
      return SignUpResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data!');
    }
  }



  Future<SignInResponse> login(SignInRequest requestModel) async {

    final response = await http.post(Uri.parse('$API_URL/auth/login'), body: requestModel.toJson());
    if (response.statusCode == 201 || response.statusCode == 400) {
      return SignInResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      print(response.statusCode);
      throw Exception('Could not connect!');
    }
  }

}