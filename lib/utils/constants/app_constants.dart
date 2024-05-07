import 'dart:ffi';

class AppConstants {

  static  RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
  static  RegExp passwordRegExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
  static  RegExp textRegExp = RegExp("[a-zA-Z]");
  static  RegExp phoneRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');




  static String baseUrl = "crudapi.co.uk";
  static String token = "0c4BHcTzI1QLQUfpDiw7CjMtk2-sJLbOOv0ZOHbOkOoCBweFrQ";

  static String users ="";

  static String clientID = "699471060311-boktfei0alnfbjc140gako8vvncn4opj.apps.googleusercontent.com";

  static String categories = "categories";
  static String products = "products";
  static String key = "AAAAOKNFCyo:APA91bEIciPPkY3Jyx2rGA27tgZrcqQpeUL-_EvpreX-m9j5cCOYrykcF7IQBkBq8EcLS_46YmyP5plH4ZYwb-7_A0j4uFXXuB09q1KwJ2MiLYrosIzg861JuiI44_DjR0nkC-2SdMlN";
  static bool malumot = true;
  static String defoltFoto = "https://static.vecteezy.com/system/resources/previews/000/662/702/original/vector-man-face-cartoon.jpg";
}


