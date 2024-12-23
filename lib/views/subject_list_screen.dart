import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentenrollment/views/enrollment_summary_screen.dart';

class SubjectListScreen extends StatefulWidget {
  final String email;

  SubjectListScreen({required this.email});

  @override
  _SubjectListScreenState createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  final List<Map<String, dynamic>> subjects = [
    {"name": "Calculus", "credits": 3},
    {"name": "Data Structure and Algorithm", "credits": 3},
    {"name": "Wireless Mobile Programming", "credits": 3},
    {"name": "Network Security", "credits": 3},
    {"name": "Statistic", "credits": 3},
    {"name": "AI", "credits": 3},
    {"name": "CGA", "credits": 3},
    {"name": "Software Engineering", "credits": 3},
    {"name": "Academic Writing", "credits": 3},
  ];
  

  final List<Map<String, dynamic>> selectedSubjects = [];
  int totalCredits = 0;
  final int maxCredits = 24;

  void toggleSubject(Map<String, dynamic> subject) {
    setState(() {
      if (selectedSubjects.contains(subject)) {
        selectedSubjects.remove(subject);
        totalCredits -= subject["credits"] as int;
      } else {
        if (totalCredits + subject["credits"] <= maxCredits) {
          selectedSubjects.add(subject);
          totalCredits += subject["credits"] as int;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Cannot select more than $maxCredits credits.",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    });
  }

  Future<void> saveToFirestore() async {
    try {
      final CollectionReference enrollmentRef =
          FirebaseFirestore.instance.collection('enrollments');

      await enrollmentRef.add({
        'email': widget.email,
        'subjects': selectedSubjects,
        'totalCredits': totalCredits,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enrollment saved successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to save enrollment: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subject Selection'),
        backgroundColor: Color(0xFF1565C0),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1565C0), Color(0xFF1976D2)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Your Subjects',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Total Credits: $totalCredits / $maxCredits',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: ListView.builder(
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          final subject = subjects[index];
                          final isSelected = selectedSubjects.contains(subject);
                          return SubjectTile(
                            subject: subject,
                            isSelected: isSelected,
                            onToggle: () => toggleSubject(subject),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: selectedSubjects.isEmpty
                      ? null
                      : () async {
                          try {
                            // Simpan data ke Firestore
                            await FirebaseFirestore.instance
                                .collection('enrollments')
                                .add({
                              'email': widget.email,
                              'subjects': selectedSubjects,
                              'totalCredits': totalCredits,
                              'timestamp': FieldValue.serverTimestamp(),
                            });

                            // Navigasi ke EnrollmentSummaryScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EnrollmentSummaryScreen(
                                    email: widget.email),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Failed to save enrollment: $e"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                  child: Text('Enroll'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubjectTile extends StatelessWidget {
  final Map<String, dynamic> subject;
  final bool isSelected;
  final VoidCallback onToggle;

  SubjectTile({
    required this.subject,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(subject["name"]),
      subtitle: Text("${subject["credits"]} Credits"),
      trailing: Checkbox(
        value: isSelected,
        onChanged: (value) => onToggle(),
      ),
    );
  }
}
