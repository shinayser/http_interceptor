import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptor_switch.dart';

abstract class PauseableInterceptorContract extends InterceptorContract {
  //This will be set by the InterceptedClient at runtime
  late HttpClientSwitch requestsSwitch;
}
