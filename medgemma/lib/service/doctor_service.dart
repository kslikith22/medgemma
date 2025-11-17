// lib/services/doctor_service.dart
import '../data/mock_data.dart';
import '../models/doctor.dart';

class DoctorService {
  // Get all doctors
  Future<List<Doctor>> getAllDoctors() async {
    await Future.delayed(Duration(milliseconds: 500));
    return MockData.doctors;
  }

  // Get doctor by user ID
  Doctor? getDoctorByUserId(String userId) {
    try {
      return MockData.doctors.firstWhere((doc) => doc.userId == userId);
    } catch (e) {
      return null;
    }
  }

  // Get doctor with user details
  Map<String, dynamic>? getDoctorWithUserDetails(String userId) {
    final doctor = getDoctorByUserId(userId);
    if (doctor == null) return null;

    final user = MockData.users.firstWhere((u) => u.id == userId);

    return {
      'doctor': doctor,
      'user': user,
    };
  }

  // Get doctors by specialization
  List<Doctor> getDoctorsBySpecialization(String specialization) {
    return MockData.doctors
        .where((doc) =>
            doc.specialization.toLowerCase() == specialization.toLowerCase())
        .toList();
  }
}
