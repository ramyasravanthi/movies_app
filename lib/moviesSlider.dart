import 'package:flutter/material.dart';

import 'constants.dart';
import 'details_screen.dart';

class moviesSlider extends StatelessWidget {
  const moviesSlider({
    super.key, required this.snapshot,
  });
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: snapshot.data!.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie:snapshot.data[index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(

                    height: 200,
                    width: 120,
                    child:Image.network(
                        filterQuality: FilterQuality.high,
                        fit:BoxFit.cover,
                        '${Constants.imagePath}${snapshot.data![index].posterPath}'
                    ),

                  ),
                ),
              ),
            );
          },
        )

    );
  }
}