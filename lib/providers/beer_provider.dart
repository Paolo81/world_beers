import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import '../models/beer.dart';

class BeerProvider with ChangeNotifier {
  bool _initialized = false;
  bool get initialized => _initialized;
  List<Beer> _beers = [];
  List<Beer> get beers => _beers;

  Future<void> getBeers() async {
    final response = await http.get(
      Uri.parse('https://api.punkapi.com/v2/beers'),
    );
    if (response.statusCode == 200) {
      try {
        final responseBeers = jsonDecode(response.body) as List;
        _initialized = true;
        _beers = [...responseBeers.map((beer) => Beer.fromJson(beer))];
      } catch (e) {
        _initialized = true;
        print(e);
      }
    } else {
      _initialized = true;
      throw Exception('Failed to load beers');
    }
    notifyListeners();
  }

  Beer findById(String id) {
    return _beers.firstWhere((beer) => beer.id.toString() == id);
  }
}
