class RentalModel {
  final String id;
  final String agencyId;
  final String cardId;
  final String userId;
  final DateTime occupiedUntil;
  final DateTime occupiedFrom;

  RentalModel({
    required this.id,
    required this.agencyId,
    required this.cardId,
    required this.userId,
    required this.occupiedUntil,
    required this.occupiedFrom,
  });

  factory RentalModel.fromJson(Map<String, dynamic> json) {
    return RentalModel(
      id: json['id'],
      agencyId: json['agencyId'],
      cardId: json['cardId'],
      userId: json['userId'],
      occupiedUntil: DateTime.parse(json['occupiedUntil']),
      occupiedFrom: DateTime.parse(json['occupiedFrom']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'agencyId': agencyId,
      'cardId': cardId,
      'userId': userId,
      'occupiedUntil': occupiedUntil.toIso8601String(),
      'occupiedFrom': occupiedFrom.toIso8601String(),
    };
  }
}

