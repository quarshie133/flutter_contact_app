import 'package:meta/meta.dart';

class Contact {
  String name;
  String email;
  String phoneNumber;
  bool isFavorite;

  Contact({
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.isFavorite = false,
  });
}
