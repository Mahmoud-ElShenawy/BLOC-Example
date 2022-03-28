import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/model/albums_model.dart';
import 'package:bloc_example/service/interface.dart';
import 'package:bloc_example/service/network/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'albums_event.dart';

part 'albums_state.dart';

@immutable
class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  final AlbumsRepository albumsRepository;
  late List<AlbumsModel> albumsList = [];

  AlbumsBloc({required this.albumsRepository}) : super(AlbumsInitState());

  @override
  Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albumsList = await albumsRepository.getAlbumsList();
          yield AlbumsLoaded(albums: albumsList);
        } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }

        break;
    }
  }
}
