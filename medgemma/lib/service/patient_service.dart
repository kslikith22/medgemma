// lib/services/patient_service.dart
import '../data/mock_data.dart';
import '../models/patient.dart';

class PatientService {
  // Get patient by user ID
  Patient? getPatientByUserId(String userId) {
    try {
      return MockData.patients.firstWhere((pat) => pat.userId == userId);
    } catch (e) {
      return null;
    }
  }

  // Get patient with user details
  Map<String, dynamic>? getPatientWithUserDetails(String userId) {
    final patient = getPatientByUserId(userId);
    if (patient == null) return null;

    final user = MockData.users.firstWhere((u) => u.id == userId);

    return {
      'patient': patient,
      'user': user,
    };
  }

  // Calculate age
  int calculateAge(DateTime dateOfBirth) {
    final now = DateTime.now();
    int age = now.year - dateOfBirth.year;
    if (now.month < dateOfBirth.month ||
        (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
      age--;
    }
    return age;
  }
}
