import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_dex/page/movie_detail_page.dart';
import '../model/movie_model.dart';
import '../service/api_service.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final ApiService _apiService = ApiService();
  
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  static const _pageSize = 20;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _apiService.fetchPopularMovies(page: pageKey);
      
      final isLastPage = newItems.length < _pageSize;
      
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB Popular Movies', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PagedListView<int, Movie>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, item, index) => MovieListItem(movie: item),
          
          firstPageProgressIndicatorBuilder: (_) => const Center(child: CircularProgressIndicator()),
          
          firstPageErrorIndicatorBuilder: (_) => Center(
            child: Text('Gagal memuat data: ${_pagingController.error}'),
          ),
          
          newPageProgressIndicatorBuilder: (_) => const Center(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(strokeWidth: 2),
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;

  const MovieListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 4,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (_) => MovieDetailPage(movie: movie)
            )
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            movie.fullPosterUrl,
            width: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.movie, size: 50),
          ),
        ),
        title: Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Rilis: ${movie.releaseDate}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text(movie.voteAverage.toStringAsFixed(1)),
          ],
        ),
      ),
    );
  }
}