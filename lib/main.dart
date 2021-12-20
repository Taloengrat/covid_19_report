import 'package:covid_19_dashboard/provider/covid_provider.dart';
import 'package:covid_19_dashboard/screens/error_screen/error_screen.dart';
import 'package:covid_19_dashboard/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CovidProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        MainScreen.routeName: (context) => const MainScreen(),
        ErrorScreen.routeName: (context) => const ErrorScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => const ErrorScreen(),
      ),
    );
  }
}
