import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modals/user.dart';
getUser(String username) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/user/'+username));

  if (response.statusCode == 200) {

    // If the server did return a 200 OK response,
    // then parse the JSON.
    return jsonDecode(response.body)[0];
  } else {

    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load user');
  }

}
Future<List> getUsersByNb(int nb) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/user/top/'+nb.toString()));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> values=<dynamic>[];
    values = json.decode(response.body);

    print(values);
    return values;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load recommendations');
  }

}