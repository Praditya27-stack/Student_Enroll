// models/subject.dart

class Subject {
  final String id;
  final String code;
  final String name;
  final int credits;
  final String description;
  bool isSelected;

  Subject({
    required this.id,
    required this.code,
    required this.name,
    required this.credits,
    required this.description,
    this.isSelected = false,
  });

  // Factory method to create a Subject from a Firestore document
  factory Subject.fromMap(Map<String, dynamic> map, String id) {
    return Subject(
      id: id,
      code: map['code'] as String,
      name: map['name'] as String,
      credits: map['credits'] as int,
      description: map['description'] as String,
      isSelected: map['isSelected'] ?? false,
    );
  }

  // Method to convert a Subject to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'credits': credits,
      'description': description,
      'isSelected': isSelected,
    };
  }
}