import 'package:covid_19_dashboard/models/covid_all_model.dart';
import 'package:covid_19_dashboard/models/covid_model.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/box_province_component.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'box_component.dart';

class ContentComponent extends StatelessWidget {
  final bool? isLoaded;
  final CovidAllModel? item;
  final bool isProvince;
  final String? provinceItem;
  const ContentComponent({
    Key? key,
    this.isLoaded,
    this.item,
    required this.isProvince,
    this.provinceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isProvince
          ? BoxProvinceComponent(item: provinceItem!)
          : isLoaded!
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                '''วันที่ ${item!.updateDate!.split(' ')[0].replaceAllMapped('-', (match) => '/')}
                             เวลา ${item!.updateDate!.split(' ')[1]}''',
                                textAlign: TextAlign.end,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            BoxComponent(
                              color: Colors.orange,
                              title: 'รายใหม่',
                              detail: item!.newCase.toString(),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            BoxComponent(
                              color: Colors.brown,
                              title: 'หายฟื้น',
                              detail: item!.newRecovered.toString(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            BoxComponent(
                              color: Colors.red,
                              title: 'เสียชีวิต',
                              detail: item!.newDeath.toString(),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            BoxComponent(
                              color: Colors.white,
                              isStrengh: true,
                              title: 'รวม',
                              detail:
                                  'สะสม: ${item!.totalCase}\nหายฟื้น: ${item!.totalRecovered}\nเสียชีวิต: ${item!.totalDeath}',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                          flex: 3,
                          child: isLoaded!
                              ? Container(
                                  padding: const EdgeInsets.all(32),
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: SfCircularChart(
                                      legend: Legend(isVisible: true),
                                      series: <PieSeries<_PieData, String>>[
                                        PieSeries<_PieData, String>(
                                          explode: true,
                                          explodeIndex: 0,
                                          pointColorMapper: (datum, index) =>
                                              datum.color,
                                          dataSource: [
                                            _PieData(
                                              'รายใหม่',
                                              item!.newCase!,
                                              Colors.orange,
                                            ),
                                            _PieData(
                                              'หายฟื้น',
                                              item!.newRecovered!,
                                              Colors.brown,
                                            ),
                                            _PieData(
                                              'เสียชีวิตเพิ่ม',
                                              item!.newDeath!,
                                              Colors.red,
                                            ),
                                          ],
                                          xValueMapper: (_PieData data, _) =>
                                              data.xData,
                                          yValueMapper: (_PieData data, _) =>
                                              data.yData,
                                          dataLabelMapper: (_PieData data, _) =>
                                              data.text,
                                          dataLabelSettings:
                                              const DataLabelSettings(
                                                  isVisible: true),
                                        ),
                                      ]),
                                )
                              : Container()),
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.color, [this.text]);
  final String xData;
  final num yData;
  final Color color;
  final String? text;
}
