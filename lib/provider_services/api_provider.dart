import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:aniuta/base/handler/handler.dart';
import 'package:aniuta/provider_services/api_services.dart';
import 'package:aniuta/src/new_test/model/news.dart';
import 'package:aniuta/utils/const/const_core.dart';
import 'package:aniuta/utils/my_config.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect with ApiServices {
  final RxString _connectionStatus = ''.obs;
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<ConnectivityResult> _connectionSubscription;

  String get connectionStatus => _connectionStatus.value;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = ConstantsCore.BASE_URL;
    httpClient.timeout = Duration(milliseconds: 20000);
    httpClient.addResponseModifier((request, response) {
      request.headers['api - key'] = '595a430e1e364be4952d4ceba47f6db1';
      _showLogWhenDebug(
        'Response',
        '\n╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════\n'
            '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
            '╟ url: ${request.url}\n'
            '╟ Headers: ${request.headers}\n'
            '╟ Status Code: ${response.statusCode}\n'
            '╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════\n',
      );
      printJson(response.bodyString.toString() ?? '');
    });

    _connectionSubscription = _connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) {
        _connectionStatus.value = result.toString();
        (_connectionStatus.value == 'ConnectivityResult.wifi')
            ? Handler().getInternetSnackBar()
            : Handler().noInternetSnackBar();
        print('Initstate : $_connectionStatus');
      },
    );
  }

  void printJson(String input) {
    const JsonDecoder decoder = JsonDecoder();
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final dynamic object = decoder.convert(input);
    final dynamic prettyString = encoder.convert(object);
    prettyString.split('\n').forEach((dynamic element) => _showLogBody(element));
  }

  dynamic _showLogWhenDebug(String status, String e) {
    if (kDebugMode) log("$status => ${e.toString()}", name: MyConfig.GETX_LOG);
  }

  dynamic _showLogBody(String e) {
    if (kDebugMode) log("${e.toString()}", name: MyConfig.GETX_LOG_BODY);
  }

  /// All API APP

  @override
  Future<Response> getNews() async {
    final response = await get(
      'top-headlines?country=in&apikey=${ConstantsCore.API_KEY}',
      decoder: (data) => News.fromJson(data),
    );
    return response;
  }

  @override
  void onClose() {
    super.onClose();
    _connectionSubscription.cancel();
  }
}
