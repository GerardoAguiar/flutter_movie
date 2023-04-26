import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies In The Theater'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_outlined)
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [

          //Principal Card
          CardSwiper(
          movies: moviesProvider.onDisplayMovies,
          ),

          //Movie Slider
          MovieSlider(
          movies: moviesProvider.popularMovies,
          title: 'Populars!',
          ),
          
        ],
      )
      )
      );
  }
}