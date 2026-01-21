
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/card.dart';

part 'api.g.dart';

final apiCard = Api();

@RestApi()
abstract class Api {
  factory Api() {
    final dio = Dio(
      BaseOptions(
        baseUrl: "https://localhost:3000/",
        contentType: "application/json"
      )
    );

    dio.interceptors.add(LogInterceptor
      (requestBody: true,
        requestHeader: true,
        responseBody: true));
    return _Api(dio);
  }

  @GET("cards/")
  Future<Cards> getCards();
}