import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:servini_app/modals/request.dart';
Future<Request> addRequest(Request request) async{
  final response =
  await http.post(Uri.parse('http://10.0.2.2:3000/request'),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
    body: jsonEncode(<String, String>{
      'title':request.title,
      'category':request.category,
      'disponibility':request.disponibility,
      'description':request.description,
      'price':request.price.toString(),
      'user':request.username
    }),
  );
  if (response.statusCode == 200) {
    // If the api did return a 200 OK response,
    // then parse the JSON.
    return Request.fromJson(jsonDecode(response.body));
  } else {
    // If the api did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load requests');
  }

}

Future<List> getRequestsByCategory(String category) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/request/category/'+category));

  if (response.statusCode == 200) {
    // If the api did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> values=<dynamic>[];
    values = json.decode(response.body);

    print(values);
    return values;
  } else {
    // If the api did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load requests');
  }

}
Future<List> getRequestsByUsername(String username) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/request/username/'+username));

  if (response.statusCode == 200) {
    // If the api did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> values=<dynamic>[];
    values = json.decode(response.body);

    print(values);
    return values;
  } else {
    // If the api did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load requests');
  }

}