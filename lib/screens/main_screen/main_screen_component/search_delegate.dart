import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/box_component.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/box_province_component.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen_component/content_component.dart';
import 'package:covid_19_dashboard/screens/province_screen/province_screen.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final List<String> dataSet;

  final List<String> recentList;

  final isProvinceLoaded;
  DataSearch(
      {required this.dataSet,
      required this.recentList,
      required this.isProvinceLoaded});

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.close,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

    return ContentComponent(
      isProvince: true,
      provinceItem: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestList = query.isEmpty
        ? recentList
        : dataSet.where((element) => element.startsWith(query)).toList();

    return suggestList.isEmpty
        ? Align(
            alignment: Alignment.topCenter,
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = suggestList[index];
                showResults(context);
              },
              title: Text(suggestList[index]),
            ),
            itemCount: suggestList.length,
          );
  }
}
