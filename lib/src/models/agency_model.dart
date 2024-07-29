
class AgencyModel {
  final String id;
  final String email;
  final String password;
  final String wilaya;
  final String city;
  final String name;
  final String lowerCaseName;
  final String ownerName;
  final String imageUrl;
  final String phoneNumber;
  final DateTime addedAt;
  final DateTime updatedAt;
  final DateTime beginDate;
  final bool isActivated;
  final List notificationsList;
  final String notificationToken;

  // notifications
  // social media

  AgencyModel({
    required this.notificationsList,
    required this.id,
    required this.notificationToken,
    required this.email,
    required this.password,
    required this.wilaya,
    required this.city,
    required this.name,
    required this.lowerCaseName,
    required this.ownerName,
    required this.imageUrl,
    required this.phoneNumber,
    required this.addedAt,
    required this.updatedAt,
    required this.beginDate,
    required this.isActivated,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      id: json['id'],
      notificationToken: json['notificationToken'],
      email: json['email'],
      password: json['password'],
      wilaya: json['wilaya'],
      city: json['city'],
      name: json['name'],
      lowerCaseName: json['lowerCaseName'],
      ownerName: json['ownerName'],
      imageUrl: json['imageUrl'],
      phoneNumber: json['phoneNumber'],
      addedAt: DateTime.parse(json['addedAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      beginDate: DateTime.parse(json['beginDate']),
      isActivated: json['isActivated'],
      notificationsList: List<dynamic>.from(json['notificationsList']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notificationToken': notificationToken,
      'email': email,
      'password': password,
      'wilaya': wilaya,
      'city': city,
      'name': name,
      'lowerCaseName': lowerCaseName,
      'ownerName': ownerName,
      'imageUrl': imageUrl,
      'phoneNumber': phoneNumber,
      'addedAt': addedAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'beginDate': beginDate.toIso8601String(),
      'isActivated': isActivated,
      'notificationsList': notificationsList,
    };
  }
}

