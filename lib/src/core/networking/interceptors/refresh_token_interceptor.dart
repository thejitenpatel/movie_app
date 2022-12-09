// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:movie_app/src/helpers/typdefs.dart';

// class RefreshTokenInterceptor extends Interceptor{
//   final Dio _dio;
//   final Reader _read;

//   RefreshTokenInterceptor(
//     this._read, {
//     required Dio dioClient,
//   }) : _dio = dioClient;

//   String get TokenExpiredException => 'TokenExpiredException';

//   @override
//   Future<void> onError(
//     DioError dioError,
//     ErrorInterceptorHandler handler,
//   ) async {
//     if (dioError.response != null) {
//       if (dioError.response!.data != null) {
//         final headers = dioError.response!.data['headers'] as JSON;

//         // Check error type to be token expired error
//         final code = headers['code'] as String;
//         if (code == TokenExpiredException) {
//           // Make new dio and lock old one
//           final tokenDio = Dio()..options = _dio.options;

//           _dio.lock();

//           // Get auth details for refresh token request
//           final kVStorageService = _read(keyValueStorageServiceProvider);
//           final currentUser = _read(currentStudentProvider);
//           final data = {
//             'erp': currentUser!.erp,
//             'password': await kVStorageService.getAuthPassword(),
//             'oldToken': await kVStorageService.getAuthToken(),
//           };

//           // Make refresh request and get new token
//           final newToken = await _refreshTokenRequest(
//             dioError: dioError,
//             handler: handler,
//             tokenDio: tokenDio,
//             data: data,
//           );

//           if (newToken == null) return super.onError(dioError, handler);

//           // Update auth and unlock old dio
//           kVStorageService.setAuthToken(newToken);

//           // Make original req with new token
//           final response = await _dio.request<JSON>(
//             dioError.requestOptions.path,
//             data: dioError.requestOptions.data,
//             cancelToken: dioError.requestOptions.cancelToken,
//             options: Options(
//               headers: <String, Object?>{'Authorization': 'Bearer $newToken'},
//             ),
//           );
//           return handler.resolve(response);
//         }
//       }
//     }

// return super.onError(dioError, handler);
//   }

//   Future<String?> _refreshTokenRequest({
//     required DioError dioError,
//     required ErrorInterceptorHandler handler,
//     required Dio tokenDio,
//     required JSON data,
//   }) async {
//     debugPrint('--> REFRESHING TOKEN');
//     try {
//       debugPrint('\tBody: $data');

//       final response = await tokenDio.post<JSON>(
//         ApiEndpoint.auth(AuthEndpoint.REFRESH_TOKEN),
//         data: data,
//       );

//       debugPrint('\tStatus code:${response.statusCode}');
//       debugPrint('\tResponse: ${response.data}');

//       // Check new token success
//       final success = response.data?['headers']['error'] == 0;

//       if (success) {
//         debugPrint('<-- END REFRESH');
//         return response.data?['body']['token'] as String;
//       } else {
//         throw Exception(response.data?['headers']['message']);
//       }
//     } on Exception catch (ex) {
//       // only caught here for logging
//       // forward to try-catch in dio_service for handling
//       debugPrint('\t--> ERROR');
//       if (ex is DioError) {
//         final de = ex;
//         debugPrint('\t\t--> Exception: ${de.error}');
//         debugPrint('\t\t--> Message: ${de.message}');
//         debugPrint('\t\t--> Response: ${de.response}');
//       } else {
//         debugPrint('\t\t--> Exception: $ex');
//       }
//       debugPrint('\t<-- END ERROR');
//       debugPrint('<-- END REFRESH');

//       return null;
//     } finally {
//       _dio
//         ..unlock()
//         ..clear();
//     }
//   }
// }