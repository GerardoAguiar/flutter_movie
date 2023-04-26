import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import '../widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title);


    return Scaffold(
      body: CustomScrollView(
       slivers: [
          _CustomAppBar(movie: movie,),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie: movie,),
              _Overview(movie: movie,),
               _Overview(movie: movie,),
              CastingCards( movieId: movie.id)
            ])
            )
        ]
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    
    return SliverAppBar(
        backgroundColor: Colors.black,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 10),
            color: Colors.black12,
            child: Text(movie.title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,),
          ),
          background: FadeInImage(
           placeholder: const AssetImage('assets/loading.gif'),  
           image: NetworkImage(movie.fullBackdropPath),
           fit: BoxFit.cover,
        ),
      )
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({super.key, required this.movie});


  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(

      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),   
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),
          const SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, 
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                ),
                Text(movie.originalTitle, 
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.grey,),
                    const SizedBox(width: 5,),
                    Text('${movie.voteAverage}', style: textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(movie.overview,
      style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}