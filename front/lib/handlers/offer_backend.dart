import 'dart:convert';

import 'package:servini_app/modals/offer.dart';
import 'package:http/http.dart' as http;
Future<Offer> addOffer(Offer offer) async{
  final response =
  await http.post(Uri.parse('http://10.0.2.2:3000/offer'),headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },

    body: jsonEncode(<String, String>{
      'title':offer.title,
      'category':offer.category,
      'disponibility':offer.disponibility,
      'description':offer.description,
      'price':offer.price.toString(),
      'user':offer.username
    }),
  );
  if (response.statusCode == 200) {
    // If the api did return a 200 OK response,
    // then parse the JSON.
    return Offer.fromJson(jsonDecode(response.body));
  } else {
    // If the api did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load offers');
  }

}
Future<List> getOffersByCategory(String category) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/offer/category/'+category));

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
    throw Exception('Failed to load offers');
  }

}
Future<List> getOffersByUsername(String username) async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/offer/username/'+username));

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
    throw Exception('Failed to load offers');
  }

}