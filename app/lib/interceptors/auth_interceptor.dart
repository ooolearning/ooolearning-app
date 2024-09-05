import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      const contentType = 'application/json; charset=UTF-8';

      data.headers.update(
        'Content-Type',
        (value) => contentType,
        ifAbsent: () => contentType,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
