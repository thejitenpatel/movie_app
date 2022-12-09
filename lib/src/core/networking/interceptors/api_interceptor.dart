import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiInterceptor extends Interceptor {
  late final Ref _ref;
  ApiInterceptor(this._ref) : super();

  // @override
  // Future<void> onRequest(
  //   RequestOptions options,
  //   RequestInterceptorHandler handler,
  // ) async {
  //   if (options.extra.containsKey('requiresAuthToken')) {
  //     if (options.extra['requiresAuthToken'] == true) {
  //       final token =
  //           await _ref.watch(keyValueStorageServiceProvider).getAuthToken();
  //       options.headers.addAll(
  //         <String, Object?>{'Authorization': 'Bearer $token'},
  //       );
  //     }

  //     options.extra.remove('requiresAuthToken');
  //   }
  //   return handler.next(options);
  // }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final success = response.data['headers']['error'] == 0;

    if (success) return handler.next(response);

    //Reject all error codes from server except 402 and 200 OK
    return handler.reject(
      DioError(
        requestOptions: response.requestOptions,
        response: response,
      ),
    );
  }
}
