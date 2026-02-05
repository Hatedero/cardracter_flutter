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
        baseUrl: "http://10.0.2.2:8000/",
        contentType: "application/json"
      )
    );

    dio.options.connectTimeout = Duration(seconds: 5000); // 5 seconds

    dio.interceptors.add(LogInterceptor
      (requestBody: true,
        requestHeader: true,
        responseBody: true));
    return _Api(dio);
  }

  @GET("cards")
  Future<Cards> getCards();

  @GET("card_with_all_attributes")
  Future<Card> getCard(@Query("id") int cardId);
}