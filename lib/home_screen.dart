import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/moviesSlider.dart';
import 'package:movies_app/trending_movies.dart';
import 'package:movies_app/api.dart/api.dart';


import 'package:movies_app/movie.dart';





class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>?> trendingMovies;
  late Future<List<Movie>?> topRatedMovies;
  late Future<List<Movie>?> upComingMovies;
  @override
  void initState(){
    super.initState();
    trendingMovies =Api().getTrendingMovies();
    topRatedMovies =Api().getTopRatedMovies();
    upComingMovies =Api().getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black38,
          title: const Text(
            'MOVIES APP',
            style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trending Movies',
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      child:FutureBuilder(
                        future: trendingMovies, builder: (Context, snapshot) {
                        if (snapshot.hasError){
                          return Center(
                            child:Text(snapshot.error.toString()),
                          );
                        }
                        else if(snapshot.hasData){
                          return trending_slider(snapshot: snapshot,);
                        }
                        else{
                          return const Center(child:CircularProgressIndicator());
                        }
                      },
                      )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Top Rated Movies',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      child:FutureBuilder(
                        future: topRatedMovies, builder: (Context, snapshot) {
                        if (snapshot.hasError){
                          return Center(
                            child:Text(snapshot.error.toString()),
                          );
                        }
                        else if(snapshot.hasData){
                          return moviesSlider(snapshot: snapshot,);
                        }
                        else{
                          return const Center(child:CircularProgressIndicator());
                        }
                      },
                      )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Up Coming Movies',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      child:FutureBuilder(
                        future: upComingMovies, builder: (Context, snapshot) {
                        if (snapshot.hasError){
                          return Center(
                            child:Text(snapshot.error.toString()),
                          );
                        }
                        else if(snapshot.hasData){
                          return moviesSlider(snapshot: snapshot,);
                        }
                        else{
                          return const Center(child:CircularProgressIndicator());
                        }
                      },
                      )
                  ),
                ],
              ),
            )));
  }
}