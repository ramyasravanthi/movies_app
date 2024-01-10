

import 'package:flutter/material.dart';
import 'constants.dart';
import 'movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                leading: Container(
                    height: 70,
                    width: 70,
                    margin: const EdgeInsets.only(
                        top: 16,
                        left: 16
                    ),
                    decoration:  BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:const Icon(
                        Icons.arrow_back_rounded,
                      ),

                    )

                ),
                backgroundColor: Colors.black38,
                expandedHeight: 500,
                pinned:true,
                floating:true,
                flexibleSpace: FlexibleSpaceBar(

                  title: Text(
                    movie.title,style: TextStyle(fontFamily:'OverlockSC',fontSize: 10,fontWeight: FontWeight.w600,),


                  ),
                  background: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft:Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.network('${Constants.imagePath}${movie.backDropPath}',
                      filterQuality:FilterQuality.high,
                      fit:BoxFit.cover,
                    ),
                  ),

                ),


              ),
              SliverToBoxAdapter(

                  child:Padding(
                    padding: EdgeInsetsDirectional.all(10),

                    child: Column(children:[
                      Text('Overview',style: TextStyle(fontFamily:'OverlockSC',fontSize: 30,fontWeight: FontWeight.w800,)
                      ),
                      const SizedBox(height:16),
                      Text(
                          movie.overview,
                          style:TextStyle(fontFamily:'OverlockSC',fontSize: 25,fontWeight: FontWeight.w400,)
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Container(
                                  padding:const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border:Border.all(color:Colors.black38),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:Row(
                                    children: [
                                      Text('Release date: ',style:TextStyle(fontFamily:'OverlockSC',fontSize: 15,fontWeight: FontWeight.bold)),
                                      Text(
                                          movie.releaseDate,
                                          style:TextStyle(fontFamily:'OverlockSC',fontSize: 15,fontWeight: FontWeight.bold)

                                      ),

                                    ],
                                  )

                              ),
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:Row(
                                    children: [
                                      Text(
                                        'Rating:',style:TextStyle(fontFamily:'OverlockSC',fontSize: 15,fontWeight: FontWeight.bold),

                                      ),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Text('${movie.voteAverage.toStringAsFixed(1)}/10',
                                          style:TextStyle(fontFamily:'OverlockSC',fontSize: 15,fontWeight: FontWeight.bold)

                                      )
                                    ],
                                  )
                              )

                            ]),
                      )
                    ]),
                  )


              )

            ]
        )
    );
  }
}