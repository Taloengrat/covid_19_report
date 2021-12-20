import 'dart:convert';

class CovidAllModel {
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
}
