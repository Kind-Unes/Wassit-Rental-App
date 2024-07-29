class NotificationModel {
  final String id;
  final String tokenId;
  final String title;
  final String description;
  final DateTime sentAt;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.tokenId,
    required this.title,
    required this.description,
    required this.sentAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      tokenId: json['tokenId'],
      title: json['title'],
      description: json['description'],
      sentAt: DateTime.parse(json['sentAt']),
      isRead: json['isRead'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tokenId': tokenId,
      'title': title,
      'description': description,
      'sentAt': sentAt.toIso8601String(),
      'isRead': isRead,
    };
  }
}
