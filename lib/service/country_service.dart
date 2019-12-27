import 'dart:async';
import 'package:world_info/pages/country.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CountryService {
  static Future<List<Country>> getCountryList() async {
    try {
      Response response = await get(
          'https://restcountries.eu/rest/v2/all?fields=name;capital;region;population;flag;alpha3Code');
      if (response.statusCode == 200) {
        return parseCountryList(response.body);
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print(e);
    }
  }

  static List<Country> parseCountryList(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
