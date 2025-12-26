import 'dart:io';

class Student {
  final String fullName;
  final String studentId;
  final String department;
  final String stage;
  final String email;
  final String phone;
  final String birthDate;
  final bool isMale;
  final File image;
  final String address;

  Student({
    required this.fullName,
    required this.studentId,
    required this.department,
    required this.stage,
    required this.email,
    required this.phone,
    required this.isMale,
    required this.image,
    required this.birthDate,
    required this.address,
  });
}
