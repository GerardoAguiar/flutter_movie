import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
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
      body: const SingleChildScrollView(
        child: Column(
        children: [

          //Principal Card
          CardSwiper(),

          MovieSlider(),
        ],
      )
      )
      );
  }
}