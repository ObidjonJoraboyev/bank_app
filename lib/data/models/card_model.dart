class CardModel {
  CardModel({
    required this.cardHolder,
    required this.cardNumber,
    required this.expireDate,
    required this.userId,
    required this.type,
    required this.cardId,
    required this.icon,
    required this.balance,
    required this.cvc,
    required this.color,
    required this.bank,
    required this.isMain,
  });

  final String cardHolder;
  final String cardNumber;
  final String expireDate;
  final String userId;
  final int type;
  final String cvc;
  final String icon;
  final double balance;
  final String cardId;
  final String color;
  final String bank;
  final bool isMain;

  CardModel copyWith({
    String? cardHolder,
    String? cardNumber,
    String? expireDate,
    String? userId,
    int? type,
    String? cvc,
    String? icon,
    double? balance,
    String? cardId,
    String? color,
    String? bank,
    bool? isMain,
  }) {
    return CardModel(
      cardHolder: cardHolder ?? this.cardHolder,
      cardNumber: cardNumber ?? this.cardNumber,
      expireDate: expireDate ?? this.expireDate,
      userId: userId ?? this.userId,
      type: type ?? this.type,
      cardId: cardId ?? this.cardId,
      icon: icon ?? this.icon,
      balance: balance ?? this.balance,
      cvc: cvc ?? this.cvc,
      color: color ?? this.color,
      bank: bank ?? this.bank,
      isMain: isMain ?? this.isMain,
    );
  }

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardHolder: json["cardHolder"] as String? ?? "",
      cardNumber: json["cardNumber"] as String? ?? "",
      expireDate: json["expireDate"] as String? ?? "",
      userId: json["userId"] as String? ?? "",
      type: json["type"] as int? ?? 0,
      cardId: json["cardId"] as String? ?? "",
      icon: json["icon"] as String? ?? "",
      balance: (json["balance"] as num? ?? 0).toDouble(),
      cvc: json["cvc"] as String? ?? "",
      color: json["color"] as String? ?? "",
      bank: json["bank"] as String? ?? "",
      isMain: json["isMain"] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "cardHolder": cardHolder,
      "expireDate": expireDate,
      "type": type,
      "cvc": cvc,
      "balance": balance,
      "icon": icon,
      "cardId": cardId,
      "cardNumber": cardNumber,
      "bank": bank,
      "color": color,
      "isMain": isMain,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "balance": balance,
      "isMain": isMain,
      "color": color,
    };
  }

  static CardModel initial() => CardModel(
        icon: "",
        balance: 0,
        cardHolder: "",
        cardNumber: "",
        cvc: "",
        userId: "",
        expireDate: "",
        type: -1,
        bank: "",
        cardId: "",
        color: "",
        isMain: false,
      );
}
