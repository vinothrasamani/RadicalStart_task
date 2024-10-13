import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:redicalstart_tasks/controllers/provider_calculator_controller.dart';
import 'package:redicalstart_tasks/views/app_home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ProviderCalculatorController(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromARGB(255, 71, 19, 122);

    return GetMaterialApp(
      title: 'All In One',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: myColor),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: myColor,
            foregroundColor: Colors.white,
          )),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: myColor),
          appBarTheme: AppBarTheme(
            backgroundColor: myColor,
            foregroundColor: Colors.white,
          )),
      home: const AppHome(),
    );
  }
}
