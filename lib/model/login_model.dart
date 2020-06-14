class LoginModel {
  final String userName;
  final String token;
  final String tokenIssued;
  final String tokenExpires;

  LoginModel(this.userName, this.token, this.tokenIssued, this.tokenExpires);

  LoginModel.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        token = json['access_token'],
        tokenIssued = json['.issued'],
        tokenExpires = json['.expires'];

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'access_token': token,
        '.issued': tokenIssued,
        '.expires': tokenExpires,
      };
}
