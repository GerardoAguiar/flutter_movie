import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/screens/screens.dart';
import 'package:provider/provider.dart';


void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ( _ ) => MoviesProvider(), 
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

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