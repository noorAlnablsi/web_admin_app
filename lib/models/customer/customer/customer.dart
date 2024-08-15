import 'dart:convert';

import 'image.dart';
import 'work_hour.dart';

class Company {
  int? id;
  String firstName;
  String lastName;
  String email;
  int phoneNumber;
  String companyName;
  int registrationNumber;
  String location;
  String city;
  String country;
  String description;
  int acceptPrivacy;
  List<Image> images;
  List<WorkHour> workHours;

  Company({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.companyName,
    required this.registrationNumber,
    required this.location,
    required this.city,
    required this.country,
    required this.description,
    required this.acceptPrivacy,
    required this.images,
    required this.workHours,
  });

  factory Company.fromMap(Map<String, dynamic> data) => Company(
        id: data['id'] as int,
        firstName: data['first_name'] as String,
        lastName: data['last_name'] as String,
        email: data['email'] as String,
        phoneNumber: data['phone_number'] as int,
        companyName: data['company_name'] as String,
        registrationNumber: data['registration_number'] as int,
        location: data['location'] as String,
        city: data['city'] as String,
        country: data['country'] as String,
        description: data['description'] as String,
        acceptPrivacy: data['accept_privacy'] as int,
        images: (data['images'] as List<dynamic>)
            .map((e) => Image.fromMap(e as Map<String, dynamic>))
            .toList(),
        workHours: (data['workHours'] as List<dynamic>)
            .map((e) => WorkHour.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
        'company_name': companyName,
        'registration_number': registrationNumber,
        'location': location,
        'city': city,
        'country': country,
        'description': description,
        'accept_privacy': acceptPrivacy,
        'images': images.map((e) => e.toMap()).toList(),
        'workHours': workHours.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Company].
  factory Company.fromJson(String data) {
    return Company.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Company] to a JSON string.
  String toJson() => json.encode(toMap());
}
