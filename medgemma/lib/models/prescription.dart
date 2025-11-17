class Prescription {
  final String id;
  final String medicineName;
  final String dosage;
  final String frequency;
  final int durationDays;
  final String instructions;
  
  Prescription({
    required this.id,
    required this.medicineName,
    required this.dosage,
    required this.frequency,
    required this.durationDays,
    required this.instructions,
  });
}