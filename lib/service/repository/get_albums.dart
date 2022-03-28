import 'package:bloc_example/common/tools.dart';
import 'package:bloc_example/model/albums_model.dart';
import 'package:bloc_example/service/constants.dart';
import 'package:bloc_example/service/interface.dart';
import 'package:bloc_example/service/network/api_provider.dart';

class GetAlbumsRepository implements AlbumsRepository {
  final ApiProvider _apiProvider = ApiProvider.internal();
  List<AlbumsModel> _listAlbums = [];
  final Tools _tools = Tools.internal();

  @override
  Future<List<AlbumsModel>> getAlbumsList() async {
    await _apiProvider.get(
        apiRoute: url,
        successResponse: (response) {
          _listAlbums = albumFromJson(response);
        },
        errorResponse: (response) {
          _tools.logger.e('Error');
        });

    return _listAlbums;
  }

  List<AlbumsModel> get listAlbums => _listAlbums;
}
