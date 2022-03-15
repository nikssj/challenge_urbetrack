// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:
import 'environment_configuration.dart';
import 'exceptions.dart';

class ApiBaseHelper {
  String baseUrl = EnvironmentConfiguration.URL_DEVELOP;

  Future get(String url, BuildContext context) async {
    var responseJson;

    http.Response response;

    try {
      response = await http
          .get(
            Uri.parse(baseUrl + url),
          )
          .timeout(Duration(seconds: 30));

      responseJson = _returnResponse(response, context);
    } on SocketException {
      throw Exception('No Internet connection');
    } on TimeoutException {
      throw Exception('Timeout get');
    } catch (e) {
      throw (e);
    }
    return responseJson;
  }

  //IMPLEMENT POST METHOD

}

dynamic _returnResponse(http.Response response, BuildContext context) async {
  switch (response.statusCode) {
    case 200:
      return json.decode(response.body.toString());

    case 400:
      var body = json.decode(response.body.toString());

      // return toastWidgetsService.mostrarToastError(context, body['msg'], false);

      break;

    case 401:

      // return toastWidgetsService.mostrarToastError(context,
      //     'Acceso no autorizado. Por favor inicie sesión nuevamente', false);
      break;

    case 403:
      // return toastWidgetsService.mostrarToastError(context,
      //     'Acceso no autorizado. Por favor inicie sesión nuevamente', false);

      break;

    case 500:
      // return toastWidgetsService.mostrarToastError(
      //     context,
      //     'Ups! Ha ocurrido un error. Por favor comunicarse con el administrador',
      //     false);
      break;
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
