import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get subjects
  Future<List<Map<String, dynamic>>> getSubjects() async {
    try {
      final snapshot = await _db.collection('subjects').get();
      return snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print("Error fetching subjects: $e");
      return [];
    }
  }

  // Save enrollment
  Future<void> saveEnrollment(String userId, List<Map<String, dynamic>> subjects) async {
    try {
      int totalCredits = subjects.fold(
        0,
        (sum, subject) => sum + (subject['credits'] as int),
      );
      await _db.collection('enrollments').doc(userId).set({
        'subjects': subjects,
        'totalCredits': totalCredits,
      });
      print("Enrollment saved successfully.");
    } catch (e) {
      print("Error saving enrollment: $e");
    }
  }

  // Get user enrollment
  Future<Map<String, dynamic>?> getEnrollment(String userId) async {
    try {
      final doc = await _db.collection('enrollments').doc(userId).get();
      return doc.exists ? doc.data() as Map<String, dynamic> : null;
    } catch (e) {
      print("Error fetching enrollment: $e");
      return null;
    }
  }
}
