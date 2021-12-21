import 'package:covid_19_dashboard/interfaces/icovid_model.dart';

class CovidAllModel implements ICovid19 {
  String? txnDate;
  int? newCase;
  int? totalCase;
  int? newCaseExcludeabroad;
  int? totalCaseExcludeabroad;
  int? newDeath;
  int? totalDeath;
  int? newRecovered;
  int? totalRecovered;
  String? updateDate;

  CovidAllModel({
    this.txnDate,
    this.newCase,
    this.totalCase,
    this.newCaseExcludeabroad,
    this.totalCaseExcludeabroad,
    this.newDeath,
    this.totalDeath,
    this.newRecovered,
    this.totalRecovered,
    this.updateDate,
  });

  factory CovidAllModel.fromJson(Map<String, dynamic> json) {
    return CovidAllModel(
      txnDate: json['txn_date'],
      newCase: json['new_case'],
      totalCase: json['total_case'],
      newCaseExcludeabroad: json['new_case_excludeabroad'],
      totalCaseExcludeabroad: json['total_case_excludeabroad'],
      newDeath: json['new_death'],
      totalDeath: json['total_death'],
      newRecovered: json['new_recovered'],
      totalRecovered: json['total_recovered'],
      updateDate: json['update_date'],
    );
  }

  @override
  int getDeath() {
    return newDeath!;
    // TODO: implement getDeath
    throw UnimplementedError();
  }

  @override
  int getNewCase() {
    return newCase!;
    // TODO: implement getNewCase
    throw UnimplementedError();
  }

  @override
  int getRecovered() {
    return newRecovered!;
    // TODO: implement getRecovered
    throw UnimplementedError();
  }

  @override
  String getSummary() {
    return 'สะสม: $totalCase\nหายฟื้น: $totalRecovered\nเสียชีวิต: $totalDeath';
    // TODO: implement getSummary
    throw UnimplementedError();
  }

  @override
  String getDate() {
    return '''วันที่ ${updateDate!.split(' ')[0].replaceAllMapped('-', (match) => '/')}
                             เวลา ${updateDate!.split(' ')[1]}''';
    // TODO: implement getDate
    throw UnimplementedError();
  }
}
