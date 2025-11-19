class Doctor {
  final String id;
  final String userId;
  final String specialization;
  final String qualification;
  final int experienceYears;
  final String hospitalName;
  final double consultationFee;
  final double rating;
  final int totalReviews;
  final List<String> availableDays;
  final String startTime;
  final String endTime;

  Doctor({
    required this.id,
    required this.userId,
    required this.specialization,
    required this.qualification,
    required this.experienceYears,
    required this.hospitalName,
    required this.consultationFee,
    required this.rating,
    required this.totalReviews,
    required this.availableDays,
    required this.startTime,
    required this.endTime,
  });
}
