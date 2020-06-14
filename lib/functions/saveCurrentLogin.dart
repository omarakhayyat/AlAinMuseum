import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview/model/login_model.dart';

saveCurrentLogin(Map responseJson) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();

  var user;
  if ((responseJson != null && responseJson.isNotEmpty)) {
    user = LoginModel.fromJson(responseJson).userName;
  } else {
    user = "";
  }
  var token = (responseJson != null &&  responseJson.isNotEmpty)
      ? LoginModel.fromJson(responseJson).token
      : "";
  var tokenIssued = (responseJson != null && responseJson.isNotEmpty)
      ? LoginModel.fromJson(responseJson).tokenIssued
      : "";
  var tokenexpires = (responseJson != null && responseJson.isNotEmpty)
      ? LoginModel.fromJson(responseJson).tokenExpires
      : "";

  await preferences.setString(
      'LastUser', (user != null && user.length > 0) ? user : "");
  await preferences.setString(
      'LastToken', (token != null && token.length > 0) ? token : "");
  await preferences.setString('TokenIssued',
      (tokenIssued != null && tokenIssued.length > 0) ? tokenIssued : "");
  await preferences.setString('TokenExpires',
      (tokenexpires != null && tokenexpires.length > 0) ? tokenexpires : "");
await preferences.setString('LocalTokenIssued', DateTime.now().toString());

}
