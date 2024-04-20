import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_detail.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.idDetails = false,
  });

  final Movie movie;
  final bool idDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title!),
        subtitle: Text('Director : ${movie.director!}'),
        leading: CircleAvatar(
          // child: Text(movie.title![0]),
          backgroundImage: NetworkImage(movie.images![0]),
        ),
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 75.0, right: 20.0, bottom: 8.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                            text: 'Released: ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${movie.released} \n'),
                        TextSpan(
                            text: 'Plot: ',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${movie.plot}'),
                      ]),
                ),
                idDetails
                    ? const Text('')
                    : TextButton(
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieDetail(
                                            movie: movie,
                                          )))
                            },
                        child: const Text('Read More'))
                // Text(movie.plot!),
              ],
            ),
          )
        ],
      ),
    );
  }
}
