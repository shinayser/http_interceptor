import 'dart:async';

import 'package:example/fake_refresh_interceptor.dart';
import 'package:example/logger_interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';

void main(List<String> arguments) async {
  final client = InterceptedClient.build(
    interceptors: [
      LoggerInterceptor(),
      FakeRefreshInterceptor(),
    ],
  );

  client.get('https://www.dnd5eapi.co/api/'.toUri());

  // await Future.wait([
  //   client.get('https://www.dnd5eapi.co/api/'.toUri()),
  // client.get('https://www.dnd5eapi.co/api/alignments/'.toUri()),
  // client.get('https://www.dnd5eapi.co/api/classes'.toUri()),
  // client.get('https://www.dnd5eapi.co/api/spells/lesser-restoration'.toUri()),
  // ]);
}
