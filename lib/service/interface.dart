import 'package:bloc_example/model/albums_model.dart';

abstract class AlbumsRepository {
  Future<List<AlbumsModel>> getAlbumsList();
}
