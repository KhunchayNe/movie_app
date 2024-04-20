import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/models/movie.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key, required this.movie});
  final Movie movie;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late Movie movie;

  @override
  void initState() {
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: Container(
          child: Column(
        children: [
          MovieCard(movie: movie),
          Text(
            movie.title!,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.images!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amberAccent,
                    elevation: 4.0,
                    child: Image.network(
                      movie.images![index],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
