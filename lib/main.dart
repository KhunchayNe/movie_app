import 'package:flutter/material.dart';
import 'package:movie_app/providers/movieProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovie(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: movieData.movieList.length,
            itemBuilder: (context, index) {
              final movie = movieData.movieList[index];
              return ListTile(
                title: Text(movie.title!),
                subtitle: Text('sub'),
                trailing: Icon(Icons.movie_creation_outlined),
                leading: CircleAvatar(
                  child: Text(movie.title![0]),
                ),
              );
              // return Card(
              //   child: Container(
              //       padding: EdgeInsets.all(8),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(movie[index]),
              //           IconButton(
              //             onPressed: () {
              //               print('$index, ${movie[index]}');
              //             },
              //             icon: const Icon(Icons.ac_unit_sharp),
              //             color: Colors.amber,
              //           ),
              //         ],
              //       )),
              // );
            }),
      ),
    );
  }
}
