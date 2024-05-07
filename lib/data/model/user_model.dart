
class UserModel {
  final String userName;
  final String lastName;
  final String password;
  final String imageUrl;
  final String phoneNumber;
  final String email;
  final String userId;
  final String fcm;
  final String authUid;

  UserModel(
      {required this.imageUrl,
        required this.email,
        required this.userName,
        required this.lastName,
        required this.password,
        required this.phoneNumber,
        required this.userId,
        required this.fcm,
        required this.authUid});

  UserModel copyWith({
    String? userName,
    String? lastName,
    String? passwordName,
    String? imageUrl,
    String? phoneNumber,
    String? email,
    String? userId,
    String? fcm,
    String? authUid,
  }) =>
      UserModel(
        userName: userName ?? this.userName,
        lastName: lastName ?? this.lastName,
        password: passwordName ?? this.password,
        imageUrl: imageUrl ?? this.imageUrl,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        userId: userId ?? this.userId,
        fcm: fcm ?? this.fcm,
        authUid: authUid ?? this.authUid,
      );

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'lastName': lastName,
      'passwordName': password,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'email': email,
      'userId': userId,
      'fcm': fcm,
      'authUid': authUid,
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      'userName': userName,
      'lastName': lastName,
      'passwordName': password,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'email': email,
      'fcm': fcm,
      'authUid': authUid,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      imageUrl: json['imageUrl'],
      email: json['email'],
      userName: json['userName'],
      lastName: json['lastName'],
      password: json['passwordName'],
      phoneNumber: json['phoneNumber'],
      userId: json['userId'],
      fcm: json['fcm'],
      authUid: json['authUid'],
    );
  }

  static UserModel initial() => UserModel(
    imageUrl: "",
    email: "",
    userName: "",
    lastName: "",
    password: "",
    phoneNumber: '',
    userId: "",
    fcm: "",
    authUid: "",
  );
}
