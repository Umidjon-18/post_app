import 'package:dio/dio.dart';
import 'package:post_app/core/api/list_api.dart';

import '../../utils/helpers/log.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.d(err.error);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (ListAPI.publicNewsBaseUrl.contains(options.baseUrl)) {
      options.headers.addAll({
        "Content-Type": "application/json",
      });
    } else {
      options.headers.addAll({
        "Content-Type": "application/json",
        "X-Api-Key": "zH2ELOPqshLZe4FwBFapJQ==LaofbTo78gza0ly5",
        "Accept": "image/jpg"
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.d(response.statusCode);
    super.onResponse(response, handler);
  }
}
