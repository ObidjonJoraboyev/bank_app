class UserModel {
  final String username;
  final String lastname;
  final String password;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String userId;

  UserModel({
    required this.username,
    required this.lastname,
    required this.password,
    required this.email,
    required this.imageUrl,
    required this.phoneNumber,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json["username"] ?? "",
        lastname: json["lastname"] ?? "",
        password: json["password"] ?? "",
        email: json["email"] ?? "",
        imageUrl: json["imageUrl"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        userId: json["userId"] ?? "");
  }

  UserModel copyWith({
    String? username,
    String? lastname,
    String? email,
    String? password,
    String? imageUrl,
    String? phoneNumber,
    String? userId,
  }) {
    return UserModel(
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      password: password ?? this.password,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "lastname": lastname,
      "password": password,
      "email": email,
      "imageUrl": imageUrl,
      "phoneNumber": phoneNumber,
      "userId": userId
    };
  }

  static UserModel initial() => UserModel(
      username: "",
      lastname: "",
      password: "",
      email: "",
      imageUrl: "",
      phoneNumber: "",
      userId: "");
}
