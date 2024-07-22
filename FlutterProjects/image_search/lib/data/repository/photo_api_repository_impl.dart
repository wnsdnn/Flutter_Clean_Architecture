import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo_model.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl({
    required this.api,
  });

  @override
  Future<List<PhotoModel>> fetch(String query) async {
    final result = await api.fetch(query);

    return result.map((json) => PhotoModel.fromJson(json)).toList();
  }
}
