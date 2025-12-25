import 'package:flutter/material.dart';

class StudentFormScreen1 extends StatefulWidget {
  const StudentFormScreen1({super.key});

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

  bool Gender = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Information Students',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _TextFieldForm(
                controller: fullNameController,
                lable: 'Full Name',
                hint: 'Enter Your Full Name',
              ),
              _TextFieldForm(
                controller: stuIdController,
                lable: 'Student ID',
                hint: 'Enter Student Id Number',
                keyboardType: TextInputType.number,
              ),
              _TextFieldForm(
                controller: departmentController,
                lable: 'Department',
                hint: 'Enter Your Department',
                keyboardType: TextInputType.text,
              ),
              _TextFieldForm(
                controller: stageController,
                lable: 'Stage',
                hint: 'Enter The Stage',
                keyboardType: TextInputType.number,
              ),
              _TextFieldForm(
                controller: emailController,
                lable: 'Email',
                hint: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress,
              ),
              _TextFieldForm(
                controller: phoneController,
                lable: 'Phone Number',
                hint: 'Enter Your Phone Number',
                keyboardType: TextInputType.number,
              ),

              // SizedBox(height: 16),
              // Divider(height: 10, thickness: 5, color: Colors.lime),
              // SizedBox(height: 10),
              //               Text(
              //                 'Gender',
              //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              //               ),
              //               Column(
              //                 children: [
              //                   Row(
              //                     children: [
              //                       Radio<bool>(
              //                         value: true,
              //                         groupValue: Gender,
              //                         onChanged: (value) => {
              //                           setState(() {
              //                             Gender = value!;
              //                           }),
              //                         },
              //                       ),
              //                       Text(
              //                         'Male',
              //                         style: TextStyle(fontWeight: FontWeight.bold),
              //                       ),
              //                       Radio<bool>(
              //                         value: false,
              //                         groupValue: Gender,
              //                         onChanged: (value) => {
              //                           setState(() {
              //                             Gender = value!;
              //                           }),
              //                         },
              //                       ),
              //                       Text(
              //                         'Female',
              //                         style: TextStyle(fontWeight: FontWeight.bold),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //               ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _TextFieldForm({
  required TextEditingController controller,
  required String lable,
  required String hint,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: EdgeInsetsGeometry.all(12),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: lable,
        hintText: hint,

        border: OutlineInputBorder(),
      ),
    ),
  );
}
