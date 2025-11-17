enum AppointmentStatus {
  scheduled,
  completed,
  cancelled,
  rescheduled,
}

class Appointment {
  final String id;
  final String patientId;
  final String doctorId;
  final DateTime appointmentDate;
  final String timeSlot;
  final AppointmentStatus status;
  final String? reasonForVisit;
  final String? notes;
  final DateTime createdAt;
  
  Appointment({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.appointmentDate,
    required this.timeSlot,
    required this.status,
    this.reasonForVisit,
    this.notes,
    required this.createdAt,
  });
}