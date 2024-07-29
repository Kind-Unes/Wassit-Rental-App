class UserModel {
  final String id;
  final String firstName;
  final String secondName;
  final String lowerCaseName;
  final String email;
  final String password;
  final String phoneNumber;
  final String imageUrl;
  final String wilaya;
  final String city;
  final List favoriteAgencies;
  final List favoriteCars;
  final List notificationsList;
  final String notificationToken;
  final DateTime joinedAt;
  final DateTime birthDate;
  final List rentedCars;

  UserModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.lowerCaseName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.imageUrl,
    required this.wilaya,
    required this.city,
    required this.favoriteAgencies,
    required this.favoriteCars,
    required this.notificationsList,
    required this.notificationToken,
    required this.joinedAt,
    required this.birthDate,
    required this.rentedCars,
  });

  // rented cars;
  // favorite agencies;
  // favorite cars;
  // notifications;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      secondName: json['secondName'],
      lowerCaseName: json['lowerCaseName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      imageUrl: json['imageUrl'],
      wilaya: json['wilaya'],
      city: json['city'],
      favoriteAgencies: List<dynamic>.from(json['favoriteAgencies']),
      favoriteCars: List<dynamic>.from(json['favoriteCars']),
      notificationsList: List<dynamic>.from(json['notificationsList']),
      notificationToken: json['notificationToken'],
      joinedAt: DateTime.parse(json['joinedAt']),
      birthDate: DateTime.parse(json['birthDate']),
      rentedCars: List<dynamic>.from(json['rentedCars']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'lowerCaseName': lowerCaseName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'wilaya': wilaya,
      'city': city,
      'favoriteAgencies': favoriteAgencies,
      'favoriteCars': favoriteCars,
      'notificationsList': notificationsList,
      'notificationToken': notificationToken,
      'joinedAt': joinedAt.toIso8601String(),
      'birthDate': birthDate.toIso8601String(),
      'rentedCars': rentedCars,
    };
  }
}

