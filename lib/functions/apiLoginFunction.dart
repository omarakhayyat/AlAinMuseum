import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview/functions/saveCurrentLogin.dart';
import 'package:webview/functions/showDialogButton.dart';
import 'package:webview/main.dart';
import 'dart:convert';

import 'package:webview/model/login_model.dart';

Future<LoginModel> requestLoginAPI(
    BuildContext context, String username, String password) async {
  final url = "https://elics.tcaabudhabi.ae/els/token";

  Map<String, String> body = {
    "grant_type": "password",
    'userName': username,
    'password': password,
  };
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  };

  final response = await http.post(
    url,
    body: body,
    headers: headers,
  );

  if (response.statusCode == 200) {
    final responseJson = json.decode(response.body);
    var user = LoginModel.fromJson(responseJson);

    saveCurrentLogin(responseJson);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));

    return LoginModel.fromJson(responseJson);
  } else {
//     final responseJson = json.decode(response.body);
// print(responseJson.toString()+"hgfdx");
//     saveCurrentLogin(responseJson);
    showDialogSingleButton(
        context,
        "Unable to Login",
        "You may have supplied an invalid 'Username' / 'Password' combination. Please try again or contact your support representative.",
        "OK");
    return null;
  }
}
