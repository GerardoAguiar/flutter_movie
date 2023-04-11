import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in the theater'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: const Center(
          child: Text('Detail Screen')),
      ),
    );
  }
}