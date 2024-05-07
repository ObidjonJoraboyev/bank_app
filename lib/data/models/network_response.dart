class NetworkResponse {
  NetworkResponse({this.data, this.errorText = '', this.errorCode = ''});

  String errorText;
  String errorCode;
  dynamic data;
}
