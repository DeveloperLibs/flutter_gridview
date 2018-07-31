import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_gridview/country.dart';
import 'package:http/http.dart' as http;

Future<List<Country>> fetchCountry(http.Client client) async {
  final response = await client.get('http://restcountries.eu/rest/v2/all');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Country> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Country> list =
      parsed.map<Country>((json) => new Country.fromJson(json)).toList();

  List<Country> listFilterd = new List<Country>();


  Set<Country> set = Set.from(list);
  set.forEach((element) => filterList(element,listFilterd));


  return listFilterd;
}

filterList(Country country, List<Country> listFiltered) {
//  if(country.name.contains("Bel")){
    listFiltered.add(country);
//  }
}

