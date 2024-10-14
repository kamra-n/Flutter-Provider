import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/data/response/status.dart';
import 'package:providerpractice/view_models/movie_view_model.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  final MovieViewModel _movieViewModel = MovieViewModel();
  @override
  void initState() {
    _movieViewModel.fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieVm = Provider.of<MovieViewModel>(context, listen: false);
    print('build');

    return SafeArea(
        child: Scaffold(
            body: ChangeNotifierProvider<MovieViewModel>(
      create: (BuildContext context) => _movieViewModel,
      child: Consumer<MovieViewModel>(
        builder: (context, value, child) {
          switch (value.movieMain.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Text(
                value.movieMain.message ?? "Error",
                style: const TextStyle(color: Colors.red),
              ));

            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.movieMain.data!.movies!.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          value.movieMain.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error_outline);
                          },
                          fit: BoxFit.fill,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      title: Text(value.movieMain.data!.movies![index].title
                          .toString()),
                      subtitle: Text(
                          value.movieMain.data!.movies![index].year.toString()),
                      onTap: () => movieVm.printMovieDetails(
                          value.movieMain.data!.movies![index]),
                    ),
                  );
                },
              );

            default:
              return const Text('null');
          }
        },
      ),
    )));
  }
}
