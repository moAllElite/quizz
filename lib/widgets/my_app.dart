import 'package:flutter/material.dart';
import 'package:quizz/widgets/home.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColorLight: Colors.black,
        primaryColor: Colors.black,
        disabledColor: Colors.deepOrange,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.black,
        primaryColorLight: Colors.black,
        brightness: Brightness.dark,
        primaryColorDark: Colors.black,
        indicatorColor: Colors.black,
        canvasColor: Colors.black,
      ),
      home: const MyHomePage(title: 'Quizz culture du japon'),
      debugShowCheckedModeBanner: false,
    );
  }
}