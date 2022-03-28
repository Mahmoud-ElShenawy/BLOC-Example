import 'package:bloc_example/service/repository/get_albums.dart';
import 'package:bloc_example/util/preferences.dart';
import 'package:bloc_example/view/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/albums_bloc/albums_bloc.dart';
import 'bloc/theme_bloc/theme_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            title: 'Flutter Bloc Demo',
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: BlocProvider(
              create: (context) => AlbumsBloc(
                albumsRepository: GetAlbumsRepository(),
              ),
              child: HomePage(title: 'TEEEEESSSSTTT',),
            ),
          );
        },
      ),
    );
  }
}