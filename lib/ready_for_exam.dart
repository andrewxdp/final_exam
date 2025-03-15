import 'package:final_exam_650710556/Card/ProfileCard.dart';
import 'package:flutter/material.dart';

class ReadyForExam extends StatefulWidget {
  const ReadyForExam({super.key});

  @override
  State<ReadyForExam> createState() => _ReadyForExamState();
}

class _ReadyForExamState extends State<ReadyForExam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.cyanAccent,
        padding: EdgeInsets.all(25),
        width: double.infinity,
        child: Center(
          child: ProfileCard(
            name: 'TeeraKarn Petchann',
            position: 'Student',
            email: 'petchann_t@Silpakorn.edu',
            phoneNumber: '0625379023',
            imageUrl: 'assets/profile.png',
            isAsset: true,
          ),
        ),
      ),
    );
    ;
  }
}
