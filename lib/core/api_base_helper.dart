// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:challenge_ubertrack/widgets/toast.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'environment_configuration.dart';
import 'exceptions.dart';

class ApiBaseHelper {
  String baseUrl = EnvironmentConfiguration.URL_DEVELOP;
  var headers = {
    "Content-Type": "application/x-www-form-urlencoded",
  };

  Future<dynamic> get(String? baseUrl, String url) async {
    var responseJson;

    http.Response response;

    try {
      response = await http
          .get(Uri.parse(baseUrl ?? this.baseUrl + url), headers: headers)
          .timeout(Duration(seconds: 30));

      responseJson = _returnResponse(response);
    } on SocketException {
      toastWidgetService.showToast('No internet connection');
      throw Exception('No Internet connection');
    } on TimeoutException {
      toastWidgetService.showToast('Timeout error');
      throw Exception('Timeout get');
    } catch (e) {
      throw (e);
    }
    return responseJson;
  }

  Future<dynamic> post(String? baseUrl, String url, body) async {
    var responseJson;

    http.Response response;

    try {
      response = await http
          .post(Uri.parse((baseUrl ?? (this.baseUrl + url))),
              headers: headers,
              body: json.encode(body),
              encoding: Encoding.getByName('utf-8'))
          .timeout(Duration(seconds: 30));

      responseJson = _returnResponse(response);
    } on SocketException {
      toastWidgetService.showToast('No internet connection');
      throw Exception('No Internet connection');
    } on TimeoutException {
      toastWidgetService.showToast('Timeout error');
      throw Exception('Timeout get');
    } catch (e) {
      throw (e);
    }
    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) async {
  switch (response.statusCode) {
    case 200:
      return json.decode(response.body);

    case 201:
      return json.decode(response.body);

    default:
      toastWidgetService.showToast(
          'Oops! An error has occurred. Please contact administration');
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
