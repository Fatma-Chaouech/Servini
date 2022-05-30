import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:servini_app/constants/routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User extends ChangeNotifier{
  late String name='bah';
  late String surname='ta';
  final storage = FlutterSecureStorage();

  User() {
    autoLoadUser();
  }
  autoLoadUser() async {

    var response = (await http.get(Uri.parse('$API_URL/user/welcome'),)).body;

    print(response);
    if (response == '') {
      print("Didn't recieve anything!");
    }
    var jsonOutput = jsonDecode(response);
    surname = jsonOutput['surname'];
    name = jsonOutput['name'];
    notifyListeners();
  }
}