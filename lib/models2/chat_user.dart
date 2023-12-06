// ignore: unused_import
import 'dart:ffi';

class ChatUser {
  ChatUser({
    required this.image,
    required this.about,
    required this.name,
    required this.createdAt,
    required this.id,
    required this.isOnline,
    required this.lastActive,
    required this.email,
    required this.pushToken,
  });
  late final String image;
  late final String about;
  late final String name;
  late final String createdAt;
  late final bool isOnline;
  late final String id;

  late final String lastActive;
  late final String email;
  late final String pushToken;

  ChatUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? '';
    isOnline = json['is_online'] ?? "";
    lastActive = json['last_active'] ?? '';
    email = json['email'] ?? '';
    pushToken = json['push _token '] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['about'] = about;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['id'] = id;

    data['last_active'] = lastActive;
    data['email'] = email;
    data['push _token '] = pushToken;
    return data;
  }
}
