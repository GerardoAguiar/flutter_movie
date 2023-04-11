import 'package:flutter/material.dart';
import 'package:movies/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
    debugShowCheckedModeBanner: false,
    title: 'Movies',
    initialRoute: 'home',
    routes: {
      'home': ( _ ) => const HomeScreen(),
      'details': ( _ ) => const DetailScreen(),
    },
    theme: ThemeData.dark().copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.black
      )
    ),
    );
  }
}