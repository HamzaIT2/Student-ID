import 'package:flutter/material.dart';
import 'package:information_student/classes.dart';
// ignore: unused_import
import 'dart:io';

import 'package:information_student/widget/appBar.dart';

class StudentID extends StatelessWidget {
  final Student student;
  const StudentID({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Student ID'),

      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                FrontCard(student: student),
                BackCard(student: student),
              ],
            );
          }
          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(2),
              child: isLandscape
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: FrontCard(student: student)),
                        Expanded(child: BackCard(student: student)),
                      ],
                    )
                  // 3. وضع Portrait
                  : Column(
                      children: [
                        FrontCard(student: student),
                        BackCard(student: student),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

class FrontCard extends StatelessWidget {
  final Student student;
  const FrontCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsets.all(16),

      elevation: 8,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Republic of Iraq \n Ministry of Higher Education and Scientific Research \n University of Nineveh',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: width * 0.9,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Student ID',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/it2.png',
                      width: 50,
                      height: 50,
                      alignment: AlignmentGeometry.centerLeft,
                    ),
                    Image.asset(
                      'images/un5.png',
                      width: 50,
                      height: 60,
                      alignment: AlignmentGeometry.centerRight,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name:${student.fullName} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Birth Day:${student.birthDate} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Address:${student.address} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'NumberID:${student.studentId} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    student.image,
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackCard extends StatelessWidget {
  final Student student;
  const BackCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsets.all(16),

      elevation: 8,
      shadowColor: Colors.black45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Republic of Iraq \n Ministry of Higher Education and Scientific Research \n University of Nineveh',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: width * 0.9,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Preliminary Studies',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'images/it2.png',
                      width: 50,
                      height: 50,
                      alignment: AlignmentGeometry.centerLeft,
                    ),
                    Image.asset(
                      'images/un5.png',
                      width: 50,
                      height: 60,
                      alignment: AlignmentGeometry.centerRight,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Department:${student.department} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'State:${student.stage} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Email:${student.email} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Phone: ${student.phone} ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
