import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/home_screen.dart';
import 'package:movies_app/moviesSlider.dart';
import 'package:movies_app/trending_movies.dart';

import 'movie.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'MOVIES APP',
      theme:ThemeData.dark().copyWith(
        scaffoldBackgroundColor:Colors.blueGrey,
      ),
      home: const HomeScreen(),

    );
  }
}
