class NetworkResponse{
  String errorText;
  dynamic data;
  String errorCode;
  NetworkResponse({this.data, this.errorText  = "",this.errorCode = ""});
}