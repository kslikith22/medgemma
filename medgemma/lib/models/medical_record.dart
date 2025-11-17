class MedicalRecord {
  final String id;
  final String patientId;
  final String doctorId;
  final DateTime visitDate;
  final String diagnosis;
  final List<String> prescriptions;
  final String? labResults;
  final String? notes;
  
  MedicalRecord({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.visitDate,
    required this.diagnosis,
    required this.prescriptions,
    this.labResults,
    this.notes,
  });
}