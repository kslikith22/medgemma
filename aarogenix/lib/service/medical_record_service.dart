import '../data/mock_data.dart';
import '../models/medical_record.dart';

class MedicalRecordService {
  // Get medical records by patient ID
  Future<List<MedicalRecord>> getMedicalRecordsByPatientId(
      String patientId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return MockData.medicalRecords
        .where((record) => record.patientId == patientId)
        .toList();
  }

  // Get medical records by doctor ID
  Future<List<MedicalRecord>> getMedicalRecordsByDoctorId(
      String doctorId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return MockData.medicalRecords
        .where((record) => record.doctorId == doctorId)
        .toList();
  }

  // Add medical record
  Future<bool> addMedicalRecord(MedicalRecord record) async {
    await Future.delayed(Duration(seconds: 1));
    MockData.medicalRecords.add(record);
    return true;
  }
}
