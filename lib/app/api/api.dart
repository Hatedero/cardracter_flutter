
import 'package:cardracter_flutter/app/model/attribute_data.dart';
import 'package:cardracter_flutter/app/model/category.dart';
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

    dio.options.connectTimeout = Duration(seconds: 50000); // 5 seconds

    dio.interceptors.add(LogInterceptor
      (requestBody: true,
        requestHeader: true,
        responseBody: true));
    return _Api(dio);
  }
  @GET("cards")
  Future<Cards> getCards();

  @GET("card_heighest_id")
  Future<int> getCardHeightsId();

  @GET("card_with_all_attributes")
  Future<Card> getCard(@Query("id") int cardId);

  @POST("card_with_all_attributes")
  Future<int> saveCard(@Query("") Card card);

  @POST("category")
  Future<int> saveCategory(@Query("title") String title, @Query("cardId") int cardId);

  @POST("attribute")
  Future<void> saveAttribute(@Query("label") String label, @Query("value") String value,@Query("categoryId") int categoryId);
}