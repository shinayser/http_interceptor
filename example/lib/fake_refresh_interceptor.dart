import 'dart:developer';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/models/pauseable_interceptor.dart';

class FakeRefreshInterceptor extends PauseableInterceptorContract {
  var needRefresh = true;

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async =>
      request;

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    if (needRefresh) {
      print('\nPausing requests to perform a fake refresh token...');
      requestsSwitch.pauseRequests();
      await Future.delayed(const Duration(milliseconds: 2000));
      requestsSwitch.resumeRequests();
      throw 'Deu ruim demais';
      needRefresh = false;
      print('Resuming requests.');
    }

    return response;
  }
}
