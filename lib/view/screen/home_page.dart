import 'package:bloc_example/bloc/albums_bloc/albums_bloc.dart';
import 'package:bloc_example/bloc/theme_bloc/theme_bloc.dart';
import 'package:bloc_example/common/style/app_theme.dart';
import 'package:bloc_example/model/albums_model.dart';
import 'package:bloc_example/util/preferences.dart';
import 'package:bloc_example/view/screen/second_page.dart';
import 'package:bloc_example/view/widget/error_widget.dart';
import 'package:bloc_example/view/widget/list_row_widget.dart';
import 'package:bloc_example/view/widget/loading_widget.dart';
import 'package:bloc_example/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadAlbums();
  }

  _loadTheme() async {
    BlocProvider.of<ThemeBloc>(context, listen: false)
        .add(ThemeEvent(appTheme: Preferences.getTheme()));
  }

  _loadAlbums() async {
    BlocProvider.of<AlbumsBloc>(context, listen: false)
        .add(AlbumEvents.fetchAlbums);
    BlocProvider.of<AlbumsBloc>(context, listen: false)
        .albumsRepository
        .getAlbumsList()
        .then((value) => print('dsadsa $value'));
  }

  _setTheme(bool darkTheme) async {
    AppTheme selectedTheme =
        darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    BlocProvider.of<ThemeBloc>(context, listen: false)
        .add(ThemeEvent(appTheme: selectedTheme));
    Preferences.saveTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const TextWidget(text: 'Albums'),
        actions: [
          Switch(
            value: Preferences.getTheme() == AppTheme.lightTheme,
            onChanged: (val) async {
              _setTheme(val);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.eighteen_mp,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
          builder: (BuildContext context, AlbumsState state) {
            if (state is AlbumsListError) {
              final error = state.error;
              String message = '${error.message}\nTap to Retry.';
              return ErrorTextWidget(
                message: message,
                onTap: _loadAlbums,
              );
            }
            if (state is AlbumsLoaded) {
              List<AlbumsModel> albums = state.albums;
              return _list(albums);
            }
            return const LoadingWidget();
          },
        ),
      ],
    );
  }

  Widget _list(List<AlbumsModel> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          AlbumsModel album = albums[index];
          return ListRowWidget(album: album);
        },
      ),
    );
  }
}