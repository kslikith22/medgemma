// lib/services/appointment_service.dart
import '../data/mock_data.dart';
import '../models/appointment.dart';

class AppointmentService {
  // Get appointments by patient ID
  Future<List<Appointment>> getAppointmentsByPatientId(String patientId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return MockData.appointments
        .where((apt) => apt.patientId == patientId)
        .toList();
  }

  // Get appointments by doctor ID
  Future<List<Appointment>> getAppointmentsByDoctorId(String doctorId) async {
    await Future.delayed(Duration(milliseconds: 500));
    return MockData.appointments
        .where((apt) => apt.doctorId == doctorId)
        .toList();
  }

  // Create new appointment
  Future<bool> createAppointment(Appointment appointment) async {
    await Future.delayed(Duration(seconds: 1));
    MockData.appointments.add(appointment);
    return true;
  }

  // Cancel appointment
  Future<bool> cancelAppointment(String appointmentId) async {
    await Future.delayed(Duration(milliseconds: 500));
    final index =
        MockData.appointments.indexWhere((apt) => apt.id == appointmentId);
    if (index != -1) {
      // In a real app, you'd update the status
      // For mock, we'll just return success
      return true;
    }
    return false;
  }

  // Get upcoming appointments
  List<Appointment> getUpcomingAppointments(List<Appointment> appointments) {
    final now = DateTime.now();
    return appointments
        .where((apt) =>
            apt.appointmentDate.isAfter(now) &&
            apt.status == AppointmentStatus.scheduled)
        .toList();
  }

  // Get past appointments
  List<Appointment> getPastAppointments(List<Appointment> appointments) {
    final now = DateTime.now();
    return appointments
        .where((apt) =>
            apt.appointmentDate.isBefore(now) ||
            apt.status == AppointmentStatus.completed)
        .toList();
  }
}
