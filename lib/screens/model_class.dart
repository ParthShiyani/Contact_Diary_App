import 'dart:io';

class Contact {
  final String? firstname;
  final String? lastname;
  final String? phonenumber;
  final String? email;
  final File? image;

  Contact({
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.email,
    required this.image,
  });
}
