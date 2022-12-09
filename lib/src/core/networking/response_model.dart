import 'package:movie_app/src/helpers/constant/app_utils.dart';
import 'package:movie_app/src/helpers/typdefs.dart';

class ResponseModel<T> {
  final _ResponseHeadersModel headers;
  final T body;

  ResponseModel({required this.headers, required this.body});

  factory ResponseModel.fromJson(JSON json) {
    return ResponseModel(
      headers: _ResponseHeadersModel.fromJson(
        json['headers'] as JSON,
      ),
      body: json['body'] as T,
    );
  }
}

class _ResponseHeadersModel {
  final bool error;
  final String message;
  final String? code;

  _ResponseHeadersModel({
    required this.error,
    required this.message,
    this.code,
  });

  factory _ResponseHeadersModel.fromJson(JSON json) {
    return _ResponseHeadersModel(
      code: json['code'] as String?,
      error: AppUtils.boolFromInt(json['error'] as int),
      message: json['message'] as String,
    );
  }
}
