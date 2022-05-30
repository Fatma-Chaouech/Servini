import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:servini_app/providers/Category.dart';
class NetworkHelper {
  String url;
  NetworkHelper(this.url);
  List _categoryList =<Category>[];
Future<List<Category>> fetchData() async{
  final response =
  await http.get(Uri.parse(url) );
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> values=<dynamic>[];
    values = json.decode(response.body);

    return values.map((categories) => Category.fromJson(categories)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load offers');
  }
}}