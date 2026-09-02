import 'package:dio/dio.dart';
import 'package:flutter_masibelajar/tugas/tugas_15/models/meals_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('/search.php?s=')
  Future<MealsResponse> getMeals();

  @GET('/lookup.php')
  Future<MealsResponse> getMealDetailById({@Query('i') required String id});
}
