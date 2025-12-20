import 'package:flutter/material.dart';
import '../model/movie_model.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title, style: const TextStyle(fontSize: 18)),
              background: Image.network(
                movie.fullPosterUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rating: ${movie.voteAverage.toStringAsFixed(1)} / 10', 
                      style: const TextStyle(fontSize: 18, color: Colors.amber)),
                    const SizedBox(height: 8),
                    Text('Rilis: ${movie.releaseDate}', 
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    const Divider(height: 30),
                    const Text('Sinopsis', 
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(movie.overview, 
                      style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}