import 'dart:convert';

import 'package:servini_app/providers/offer.dart';
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
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Offer.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load offers');
  }

}