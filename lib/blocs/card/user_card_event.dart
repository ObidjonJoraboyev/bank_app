import 'package:banking_app/data/models/card_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserCardsEvent extends Equatable {}

class AddCardEvent extends UserCardsEvent {
  AddCardEvent({required this.cardModel});

  final CardModel cardModel;

  @override
  List<Object?> get props => [cardModel];
}

class UpdateCardEvent extends UserCardsEvent {
  UpdateCardEvent({required this.cardModel});

  final CardModel cardModel;

  @override
  List<Object?> get props => [cardModel];
}

class DeleteCardEvent extends UserCardsEvent {
  DeleteCardEvent({required this.cardDocId});

  final String cardDocId;

  @override
  List<Object?> get props => [cardDocId];
}

class GetCardsByUserIdEvent extends UserCardsEvent {
  GetCardsByUserIdEvent({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class GetCardsDatabaseEvent extends UserCardsEvent {
  @override
  List<Object?> get props => [];
}
