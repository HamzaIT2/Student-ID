import 'dart:io';

import 'package:flutter/material.dart';
import 'package:information_student/classes.dart';
import 'package:information_student/screen2.dart';
import 'package:information_student/widget/app_Bar.dart';
import 'package:information_student/widget/image_picker.dart';

class StudentFormScreen1 extends StatefulWidget {
  const StudentFormScreen1({super.key, student});

  @override
  State<StudentFormScreen1> createState() => _StudentFormScreen1State();
}

class _StudentFormScreen1State extends State<StudentFormScreen1> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController stuIdController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  // ignore: non_constant_identifier_names
  bool Gender = true;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Information Student'),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register Information Student',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Image.asset('images/it.jpeg', width: 50, height: 50),
                ],
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 2, color: Colors.lime),
              _TextFieldForm(
                controller: fullNameController,
                label: 'Full Name',
                hint: 'Enter Your Full Name',
                icon: Icons.person,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Full Name';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              _TextFieldForm(
                controller: birthDateController,
                label: 'Birth Date',
                hint: 'Enter Your Birth Date',
                keyboardType: TextInputType.datetime,
                icon: Icons.date_range,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Date';
                  }
                  return null;
                },
              ),
              _TextFieldForm(
                controller: addressController,
                label: 'Address',
                hint: 'Enter Your Address',
                keyboardType: TextInputType.text,
                icon: Icons.location_city,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Address';
                  }
                  return null;
                },
              ),
              _TextFieldForm(
                controller: stuIdController,
                label: 'Student ID',
                hint: 'Enter Student Id Number',
                keyboardType: TextInputType.number,
                icon: Icons.person,
                validation: (value) {
                  if (value == null || value.isEmpty) return 'Please enter ID';
                  return null;
                },
              ),
              _TextFieldForm(
                controller: departmentController,
                label: 'Department',
                hint: 'Enter Your Department',
                keyboardType: TextInputType.text,
                icon: Icons.account_balance,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Department';
                  }
                  return null;
                },
              ),
              _TextFieldForm(
                controller: stageController,
                label: 'Stage',
                hint: 'Enter The Stage',
                keyboardType: TextInputType.number,
                icon: Icons.layers,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Stage';
                  }
                  return null;
                },
              ),
              _TextFieldForm(
                controller: emailController,
                label: 'Email',
                hint: 'example@gmail.com',
                keyboardType: TextInputType.emailAddress,
                icon: Icons.email,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Email';
                  }
                  bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(value);
                  if (!emailValid) {
                    return 'Email is not Valid';
                  }
                  return null;
                },
              ),
              _TextFieldForm(
                controller: phoneController,
                label: 'Phone Number',
                hint: 'Enter Your Phone Number',
                keyboardType: TextInputType.number,
                icon: Icons.phone,
                maxLength: 11,
                prefixText: "+964 ",
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Phone';
                  }
                  if (value.length < 10) return 'Phone number is too short';
                  return null;
                },
              ),
              SizedBox(height: 16),
              Divider(height: 10, thickness: 2, color: Colors.lime),
              SizedBox(height: 10),
              Text(
                'Gender',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: Gender,
                        onChanged: (value) => {
                          setState(() {
                            Gender = value!;
                          }),
                        },
                      ),
                      Text(
                        'Male',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Radio<bool>(
                        value: false,
                        groupValue: Gender,
                        onChanged: (value) => {
                          setState(() {
                            Gender = value!;
                          }),
                        },
                      ),
                      Text(
                        'Female',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(height: 10, thickness: 2, color: Colors.lime),
              SizedBox(height: 10),
              Text(
                'Add Personal Photo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 15),
              ImagePickerWidget(
                onImageSelected: (image) {
                  setState(() {
                    selectedImage = image;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      selectedImage != null) {
                    final student = Student(
                      fullName: fullNameController.text,
                      birthDate: birthDateController.text,
                      address: addressController.text,
                      studentId: stuIdController.text,
                      department: departmentController.text,
                      stage: stageController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      isMale: Gender,
                      image: selectedImage!,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentID(student: student),
                      ),
                    );
                  } else if (selectedImage == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select an image')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _TextFieldForm({
  required TextEditingController controller,
  required String label,
  String? hint,
  required IconData icon,
  int? maxLength,
  String? prefixText,
  String? Function(String?)? validation,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: EdgeInsetsGeometry.all(12),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,

      validator: validation,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixText: prefixText,
        prefixStyle: TextStyle(fontWeight: FontWeight.bold),
        suffixStyle: TextStyle(fontWeight: FontWeight.bold),
        prefixIcon: Icon(icon),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 3.0, color: Colors.black12),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      maxLength: maxLength,
    ),
  );
}
