import 'package:dio/dio.dart';

class ApiService {
  static Future<Response> getRandomDogImage() async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://dog.ceo/api/breeds/image/random");

    return response;
  }

  static Future<Response> getImagesListByBreed(
      {required String breedName}) async {
    Dio dio = Dio();
    Response response =
        await dio.get("https://dog.ceo/api/breed/$breedName/images");

    return response;
  }

  static Future<Response> getRandomImageBreedSubBreed(
      {required String breed, required String subBreed}) async {
    Dio dio = Dio();
    Response response = await dio
        .get("https://dog.ceo/api/breed/$breed/$subBreed/images/random");

    return response;
  }

  static Future<Response> getImagesListByBreedSubBreed(
      {required String breedName, required String subBreedName}) async {
    Dio dio = Dio();
    Response response = await dio
        .get("https://dog.ceo/api/breed/$breedName/$subBreedName/images");

    return response;
  }
}
