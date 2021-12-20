class CovidModel {
  String province;
  String date;
  int newCase;
  int totalCase;
  int newCaseExcludeAbroad;
  int totalCaseExcludeAbroad;
  int newDeath;
  int totalDeath;
  String updateDate;

  CovidModel({
    required this.date,
    required this.newCase,
    required this.newCaseExcludeAbroad,
    required this.newDeath,
    required this.province,
    required this.totalCase,
    required this.totalCaseExcludeAbroad,
    required this.totalDeath,
    required this.updateDate,
  });

  factory CovidModel.fromJson(Map<String, dynamic> json) {
    return CovidModel(
        province: json['province'],
        date: json['txn_date'],
        newCase: json['new_case'],
        totalCase: json['total_case'],
        newCaseExcludeAbroad: json['new_case_excludeabroad'],
        totalCaseExcludeAbroad: json['total_case_excludeabroad'],
        newDeath: json['new_death'],
        totalDeath: json['total_death'],
        updateDate: json['update_date']);
  }
}
