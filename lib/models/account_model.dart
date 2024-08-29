//import 'package:flutter/foundation.dart';

class Account {
  final String username;
  final String email;
  final List<String> watchHistory;
  final List<String> announcements;
  final String profileImageUrl;

  Account({
    required this.username,
    required this.email,
    required this.watchHistory,
    required this.announcements,
    this.profileImageUrl =
        'https://via.placeholder.com/150', // Default placeholder image
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      username: json['username'],
      email: json['email'],
      watchHistory: List<String>.from(json['watchHistory']),
      announcements: List<String>.from(json['announcements']),
      profileImageUrl:
          json['profileImageUrl'] ?? 'https://via.placeholder.com/150',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'watchHistory': watchHistory,
      'announcements': announcements,
      'profileImageUrl': profileImageUrl,
    };
  }
}
