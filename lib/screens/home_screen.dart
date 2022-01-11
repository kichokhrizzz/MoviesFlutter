import 'package:flutter/material.dart';
import 'package:peliculas_flutter/providers/movies_provider.dart';
import 'package:peliculas_flutter/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PopCornApp'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child:  Column(
        children: [

          CardSwiper( movies: moviesProvider.onDisplayMovies ),

          MovieSlider( movies : moviesProvider.popularMovies , title: 'Populares'),

        ],
      ),
      )
    );
  }
}