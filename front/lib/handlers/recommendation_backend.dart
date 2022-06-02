import 'dart:convert';

import 'package:servini_app/modals/recommendation.dart';
import 'package:http/http.dart' as http;
Future<Recommendation> addRecommendation(Recommendation recommendation) async{
  final response =
  await http.post(Uri.parse('http://10.0.2.2:3000/recommendation'),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },

    body: jsonEncode(<String, String>{
      'giver':recommendation.giver,
      'receiver':recommendation.receiver,
      'rating':recommendation.rating.toString(),

    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Recommendation.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load recommendations');
  }

}

Future<List> getRecommendationsByUser(String user) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/recommendation/user/'+user));

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

