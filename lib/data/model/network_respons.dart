class NetworkResponse {
  String errorText;
  String errorCode;

  dynamic data;

  NetworkResponse({this.data, this.errorText = "", this.errorCode = ""});
}
