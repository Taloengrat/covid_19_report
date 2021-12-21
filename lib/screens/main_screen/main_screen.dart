import 'package:covid_19_dashboard/constance.dart';
import 'package:covid_19_dashboard/provider/covid_provider.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/components/content_component.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isSearch = false;
  bool isLoaded = false;
  bool isProvinceLoaded = false;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Provider.of<CovidProvider>(context, listen: false)
          .fetch(true)
          .then((response) => {
                if (response)
                  {
                    setState(() {
                      isLoaded = true;
                      Provider.of<CovidProvider>(context, listen: false)
                          .fetch(false)
                          .then((value) => setState(() {
                                isProvinceLoaded = true;
                              }));
                    })
                  }
              });
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<CovidProvider>(context).allCountry;
    final itemProvince = Provider.of<CovidProvider>(context).item;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isSearch ? Colors.white : Colors.blueGrey,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/coronavirus.png'),
        ),
        title: const Text(TITLE),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: DataSearch(
                      isProvinceLoaded: isProvinceLoaded,
                      dataSet: itemProvince.map((e) => e.province).toList(),
                      recentList:
                          itemProvince.map((e) => e.province).toList()));
            },
            icon: Icon(
              Icons.search_rounded,
              color: isSearch ? Colors.black : Colors.white,
            ),
          )
        ],
      ),
      body: ContentComponent(
        isProvince: false,
        isLoaded: isLoaded,
        item: item,
      ),
    );
  }
}
