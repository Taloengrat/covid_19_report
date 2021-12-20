import 'dart:convert';

import 'package:covid_19_dashboard/models/covid_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  CovidBloc(CovidState initialState) : super(initialState);

  CovidState get initialState => InitialCovidAllState();

  // Stream<CovidState> mapEventToState() async* {

  //   if(){

  //   }
  //   return yield
  // }
}
