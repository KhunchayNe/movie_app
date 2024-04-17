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
  Widget build(BuildContext context) {
    final movies = Provider.of<MovieProvider>(context).loadMovie();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(movies[index]),
                leading: CircleAvatar(
                  child: Text(movies[index][0]),
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
