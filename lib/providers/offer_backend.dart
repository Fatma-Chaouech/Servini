import 'dart:convert';

import 'package:servini_app/providers/offer.dart';
import 'package:http/http.dart' as http;
Future<Offer> fetchOffers() async{
  final response =
  await http.get(Uri.parse('http://10.0.2.2:3000/tododb/one/1'));

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