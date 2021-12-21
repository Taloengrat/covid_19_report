import 'package:covid_19_dashboard/provider/covid_provider.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/components/content_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoxProvinceComponent extends StatelessWidget {
  final String item;

  const BoxProvinceComponent({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provinceInstance = Provider.of<CovidProvider>(context).findItem(item);

    return provinceInstance != null
        ? ContentComponent(
            isProvince: false,
            isLoaded: true,
            item: provinceInstance,
          )
        : Container();
  }
}
