import 'package:flutter/material.dart';
import 'page/movie_list_page.dart'; 

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Film TMDB',
      
      debugShowCheckedModeBanner: false, 

      theme: ThemeData(
        primarySwatch: Colors.blue, 
        primaryColor: const Color(0xFF03A9F4),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.5,
        ),
      ),

      home: const MovieListPage(), 
    );
  }
}