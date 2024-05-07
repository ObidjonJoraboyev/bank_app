import 'package:banking_app/data/models/card_model.dart';
import 'package:banking_app/data/models/network_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardRepository {
  Future<NetworkResponse> addCard(CardModel cardModel) async {
    try {
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection('cards')
          .add(cardModel.toJson());

      await FirebaseFirestore.instance
          .collection('cards')
          .doc(documentReference.id)
          .update({"cardId": documentReference.id});

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> updateCard(CardModel cardModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('cards')
          .doc(cardModel.cardId)
          .update(cardModel.toJsonForUpdate());

      return NetworkResponse(errorText: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Future<NetworkResponse> deleteCard(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('cards').doc(docId).delete();

      return NetworkResponse(data: "success");
    } on FirebaseException catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }

  Stream<List<CardModel>> getCardsByUserId(String userId) =>
      FirebaseFirestore.instance
          .collection('cards')
          .where("userId", isEqualTo: userId)
          .snapshots()
          .map((event) =>
              event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());

  Stream<List<CardModel>> getCardsDatabase() => FirebaseFirestore.instance
      .collection('cards_database')
      .snapshots()
      .map((event) =>
          event.docs.map((doc) => CardModel.fromJson(doc.data())).toList());
}
