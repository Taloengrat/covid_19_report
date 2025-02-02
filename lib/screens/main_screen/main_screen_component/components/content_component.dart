import 'package:covid_19_dashboard/interfaces/icovid_model.dart';
import 'package:covid_19_dashboard/models/covid_all_model.dart';
import 'package:covid_19_dashboard/models/covid_model.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/components/box_province_component.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'box_component.dart';

class ContentComponent extends StatelessWidget {
  final bool? isLoaded;
  final ICovid19? item;
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
      child: isProvince && provinceItem != null
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
                                item!.getDate(),
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
                              detail: item!.getNewCase().toString(),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            BoxComponent(
                              color: Colors.brown,
                              title: 'หายฟื้น',
                              detail: item!.getRecovered().toString(),
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
                              detail: item!.getDeath().toString(),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            BoxComponent(
                              color: Colors.white,
                              isStrengh: true,
                              title: 'รวม',
                              detail: item!.getSummary(),
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
                                              item!.getNewCase(),
                                              Colors.orange,
                                            ),
                                            _PieData(
                                              'หายฟื้น',
                                              item!.getRecovered()!,
                                              Colors.brown,
                                            ),
                                            _PieData(
                                              'เสียชีวิตเพิ่ม',
                                              item!.getDeath(),
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
