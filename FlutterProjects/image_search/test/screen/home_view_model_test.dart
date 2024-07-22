import 'package:flutter_test/flutter_test.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo_model.dart';
import 'package:image_search/screen/home_view_model.dart';

void main() {
  // ViewModel 테스트
  test("Stream이 잘 동작해야 한다.", () async {
    final viewModel = HomeViewModel(repository: FakePhotoApiRepository());

    await viewModel.fetch('apple');

    final result = fakeJson.map((json) => PhotoModel.fromJson(json)).toList();

    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<PhotoModel>> fetch(String query) async {
    // 0.5초간 대기
    Future.delayed(Duration(milliseconds: 500));

    return fakeJson.map((json) => PhotoModel.fromJson(json)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 4999205,
    "pageURL":
        "https://pixabay.com/photos/spring-flower-apple-nature-pink-4999205/",
    "type": "photo",
    "tags": "spring, flower background, flower",
    "previewURL":
        "https://cdn.pixabay.com/photo/2020/04/03/14/58/spring-4999205_150.jpg",
    "previewWidth": 150,
    "previewHeight": 100,
    "webformatURL":
        "https://pixabay.com/get/g6ceb153f57e53acf8b7e7df82a9a89ac9794daf65691d17235412862c20066b4faf3e1cb63bf45ad502a782630874dc8dce11e10066a8c7d672751883007f077_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 427,
    "largeImageURL":
        "https://pixabay.com/get/gf329b266b5850ff16c5a4510065bb7c8c11a049f2ea3b7b5e25bfc859c2ebdf2ec78d5e40c1a6b9034f5ef08b299a596fe89294670a6a55a0a9fa9ae21737099_1280.jpg",
    "imageWidth": 4896,
    "imageHeight": 3264,
    "imageSize": 2614293,
    "views": 17336,
    "downloads": 14134,
    "collections": 73,
    "likes": 81,
    "comments": 17,
    "user_id": 8237000,
    "user": "krystianwin",
    "userImageURL":
        "https://cdn.pixabay.com/user/2020/10/11/12-28-32-578_250x250.jpg"
  },
  {
    "id": 2788599,
    "pageURL":
        "https://pixabay.com/photos/apples-red-apple-ripe-apple-orchard-2788599/",
    "type": "photo",
    "tags": "apples, red apple, ripe",
    "previewURL":
        "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g964d4356995c367ff014c71f128b02f0592938bb0519713f3ec1ceacb854be2755b6e86a49675962015c878de117a966b98fa1554fff6ef8f9134c8c23535c26_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/g7a41a74b4fa08990fb80871692b94c3ca6b65abc4fc65c56aac377eac0db5f75266a03cc25efe31dea05e9f4eb7d782560000e6be61baa6c4216a5ac8c49a252_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3660484,
    "views": 164556,
    "downloads": 93102,
    "collections": 591,
    "likes": 654,
    "comments": 78,
    "user_id": 2364555,
    "user": "NoName_13",
    "userImageURL":
        "https://cdn.pixabay.com/user/2022/12/12/07-40-59-226_250x250.jpg"
  },
];
