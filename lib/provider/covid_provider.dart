import 'dart:convert';

import 'package:covid_19_dashboard/models/covid_all_model.dart';
import 'package:covid_19_dashboard/models/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidProvider with ChangeNotifier {
  static const String URL_ALL =
      'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all';

  static const URL_PROVINCE =
      'https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces';
  late List<CovidModel> _items = [];

  CovidAllModel _allCountry = CovidAllModel();

  List<CovidModel> get item => _items;

  CovidAllModel get allCountry => _allCountry;

  CovidModel findItem(String province) => _items
      .firstWhere((element) => element.province == province, orElse: null);

  addCountry(CovidAllModel model) {
    _allCountry = model;
    notifyListeners();
  }

  setProvinceList(List<CovidModel> item) {
    _items = item;
    notifyListeners();
  }

  update(int index, CovidModel model) {
    _items[index] = model;
    notifyListeners();
  }

  Future<bool> fetch(bool isFetchAll) async {
    final response =
        await http.get(Uri.parse(isFetchAll ? URL_ALL : URL_PROVINCE));

    if (response.statusCode == 200) {
      if (isFetchAll) {
        final model = CovidAllModel.fromJson(jsonDecode(response.body)[0]);
        addCountry(model);
        return true;
      } else {
        Iterable jsonResList = jsonDecode(response.body);
        final provinceList = List<CovidModel>.from(
            jsonResList.map((e) => CovidModel.fromJson(e)));
        setProvinceList(provinceList);
        return true;
      }
    } else {
      return false;
    }
  }
}
