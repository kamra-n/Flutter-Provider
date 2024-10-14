import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/view_models/count_provider.dart';
import 'package:providerpractice/view_models/login_view_model.dart';
import 'package:providerpractice/view_models/movie_view_model.dart';
// import 'package:providerpractice/views/login_view.dart';
import 'package:providerpractice/views/movie_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => MovieViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MovieView(),
      ),
    );
  }
}
