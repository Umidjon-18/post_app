import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'dio_interceptor.dart';
import '../error/failure.dart';

typedef ConverterFunctionType<T> = T Function(dynamic response);

class DioClient {
  final Dio _dio = Dio()..interceptors.add(DioInterceptor());

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    required ConverterFunctionType<T> converter,
  }) async {
    try {
      var response = await _dio.get(url, queryParameters: queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(converter(response.data));
      }
      throw DioError(
        requestOptions: response.requestOptions,
        response: response,
      );
    } on DioError catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
