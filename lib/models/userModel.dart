import 'dart:convert';

class User {
  String username;
  String password;
  String email;
  String phoneNumber;
  String spokenLanguage;
  String subtitleLanguage;

  User({
    required this.username,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.spokenLanguage,
    required this.subtitleLanguage,
  });

  // Method to convert a User object to a map
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'spokenLanguage': spokenLanguage,
      'subtitleLanguage': subtitleLanguage,
    };
  }

  // Method to create a User object from a map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      password: map['password'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      spokenLanguage: map['spokenLanguage'],
      subtitleLanguage: map['subtitleLanguage'],
    );
  }

  // Method to convert a User object to JSON
  String toJson() {
    return json.encode(toMap());
  }

  // Method to create a User object from JSON
  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source));
  }
}
