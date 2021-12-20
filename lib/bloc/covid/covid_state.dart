part of 'covid_bloc.dart';

abstract class CovidState {}

class InitialCovidAllState extends CovidState {
  static const String API_ALL =
      'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all';

  fetch() async {
    final response = await http.get(
      Uri.parse(API_ALL),
    );

    if (response.statusCode == 200) {
      CovidModel.fromJson(jsonDecode(response.body));
    }
  }
}

class InitialCovidProvinceState extends CovidState {
  static const URL =
      'https://covid19.ddc.moph.go.th/api/Cases/today-cases-by-provinces';

  fetch() async {
    final response = await http.get(Uri.parse(URL));

    if (response.statusCode == 200) {
      CovidModel.fromJson(jsonDecode(response.body));
    }
  }
}
