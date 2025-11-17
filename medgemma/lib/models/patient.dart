class Patient {
  final String id;
  final String userId;
  final DateTime dateOfBirth;
  final String bloodGroup;
  final double height;
  final double weight;
  final List<String> allergies;
  final List<String> chronicConditions;
  final String emergencyContact;
  
  Patient({
    required this.id,
    required this.userId,
    required this.dateOfBirth,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.allergies,
    required this.chronicConditions,
    required this.emergencyContact,
  });
}
