class AdminModel {
  final String name;
  final String id;
  final DateTime joinedDate;
  final bool isActivated;
  final String email;
  final String phoneNumber;
  final String password;
  final bool isOwner;

  AdminModel(
      {required this.name,
      required this.id,
      required this.joinedDate,
      required this.isActivated,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.isOwner});

  // toJson
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "id": id,
      "joinedDate": joinedDate.toIso8601String(),
      "isActivated": isActivated,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "isOwner": isOwner,
    };
  }

  // fromJson
  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      name: json['name'],
      id: json['id'],
      joinedDate: DateTime.parse(json['joinedDate']),
      isActivated: json['isActivated'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      isOwner: json['isOwner'],
    );
  }
}
