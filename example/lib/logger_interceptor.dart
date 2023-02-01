import 'dart:convert';

import 'package:http_interceptor/http_interceptor.dart';

class LoggerInterceptor extends InterceptorContract {
  var needRefresh = true;

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    print('╔═');
    print('║ Request ${request.method} ${request.url}');
    print('║ Headers: ${request.headers}');

    if (request is Request && request.body.isNotEmpty) {
      print('║ Body: ${request.body}');
    }

    print('╚═');
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    print('╔═');
    print('║ Response [${response.statusCode}] for ${response.request?.url}');

    if (response is Response) {
      if (response.contentType == 'application/json') {
        response = response.copyWith(
          body: json.decode(response.body.toString()).toString(),
        );
      }

      print('╚ Body: ${response.body}');
    } else {
      print(response.toString());
    }

    return response;
  }
}
