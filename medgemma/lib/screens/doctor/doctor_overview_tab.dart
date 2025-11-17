// lib/screens/doctor/doctor_overview_tab.dart
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medgemma/core/theme/app_colors.dart';
import 'package:medgemma/screens/doctor/consultation_screen.dart';
import 'package:medgemma/service/appointment_service.dart';
import 'package:medgemma/service/patient_service.dart';

import '../../data/mock_data.dart';
import '../../models/appointment.dart';
import '../../models/user.dart';

class DoctorOverviewTab extends StatelessWidget {
  final User user;
  final dynamic doctor;
  final List<Appointment> appointments;
  final Function(int) onTabChange;

  const DoctorOverviewTab({
    super.key,
    required this.user,
    required this.doctor,
    required this.appointments,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final appointmentService = AppointmentService();
    final patientService = PatientService();

    // Get today's appointments
    final now = DateTime.now();
    final todayAppointments = appointments.where((apt) {
      return apt.appointmentDate.day == now.day &&
          apt.appointmentDate.month == now.month &&
          apt.appointmentDate.year == now.year &&
          apt.status == AppointmentStatus.scheduled;
    }).toList();

    // Sort to get next appointment
    todayAppointments
        .sort((a, b) => a.appointmentDate.compareTo(b.appointmentDate));
    final nextAppointment =
        todayAppointments.isNotEmpty ? todayAppointments.first : null;

    // Calculate monthly statistics
    final thisMonthStats = _calculateMonthStats(appointments, now);
    final lastMonthStats = _calculateMonthStats(
      appointments,
      DateTime(now.year, now.month - 1, 1),
    );

    // Calculate percentage changes
    final appointmentChange = _calculatePercentageChange(
      lastMonthStats['appointments']!,
      thisMonthStats['appointments']!,
    );
    final prescriptionChange = _calculatePercentageChange(
      lastMonthStats['prescriptions']!,
      thisMonthStats['prescriptions']!,
    );

    final upcomingAppointments =
        appointmentService.getUpcomingAppointments(appointments);
    final completedAppointments = appointments
        .where((apt) => apt.status == AppointmentStatus.completed)
        .length;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Compact Header Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppColors.primaryGradient,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good ${_getGreeting()}, Dr. ${user.fullName.replaceFirst('Dr. ', '')}',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        doctor?.specialization ?? 'Medical Practitioner',
                        style: TextStyle(
                          color: AppColors.textWhite.withOpacity(0.9),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                // Quick Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: AppColors.textWhite, size: 16),
                      SizedBox(width: 6),
                      Text(
                        '${doctor?.rating ?? 0}',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // NEXT APPOINTMENT - Featured at Top
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.alarm,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Next Appointment',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () => onTabChange(1),
                      child: Text('View All'),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                if (nextAppointment == null)
                  _buildEmptyAppointmentCard()
                else
                  _buildFeaturedAppointmentCard(
                    context,
                    nextAppointment,
                    patientService,
                  ),
              ],
            ),
          ),

          // TODAY'S OVERVIEW - Quick Stats
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Overview',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildCompactStatCard(
                        'Today',
                        todayAppointments.length.toString(),
                        Icons.today,
                        AppColors.chartBlue,
                        'Scheduled',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildCompactStatCard(
                        'Upcoming',
                        upcomingAppointments.length.toString(),
                        Icons.upcoming,
                        AppColors.chartOrange,
                        'This week',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _buildCompactStatCard(
                        'Completed',
                        completedAppointments.toString(),
                        Icons.check_circle,
                        AppColors.success,
                        'Total',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // INSIGHTS & ANALYTICS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.chartPurple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: AppColors.chartPurple,
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Performance Insights',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Appointments Analytics
                _buildImpactfulComparisonCard(
                  'Patient Consultations',
                  Icons.people,
                  thisMonthStats['appointments']!,
                  lastMonthStats['appointments']!,
                  appointmentChange,
                  AppColors.chartBlue,
                  'appointments this month',
                ),
                SizedBox(height: 12),

                // Prescriptions Analytics
                _buildImpactfulComparisonCard(
                  'Prescriptions Issued',
                  Icons.medication,
                  thisMonthStats['prescriptions']!,
                  lastMonthStats['prescriptions']!,
                  prescriptionChange,
                  AppColors.chartPurple,
                  'prescriptions written',
                ),
              ],
            ),
          ),

          SizedBox(height: 24),

          // PERFORMANCE SUMMARY
          if (doctor != null) ...[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Profile Summary',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withOpacity(0.05),
                          AppColors.chartBlue.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: _buildProfileMetric(
                                  Icons.star_rounded,
                                  '${doctor.rating}',
                                  'Rating',
                                  Colors.amber,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: AppColors.divider,
                              ),
                              Expanded(
                                child: _buildProfileMetric(
                                  Icons.reviews,
                                  '${doctor.totalReviews}',
                                  'Reviews',
                                  AppColors.chartBlue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Divider(color: AppColors.divider),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildProfileMetric(
                                  Icons.work_history,
                                  '${doctor.experienceYears}',
                                  'Years Experience',
                                  AppColors.chartOrange,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: AppColors.divider,
                              ),
                              Expanded(
                                child: _buildProfileMetric(
                                  Icons.currency_rupee,
                                  '${doctor.consultationFee}',
                                  'Consultation Fee',
                                  AppColors.success,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildFeaturedAppointmentCard(
    BuildContext context,
    Appointment appointment,
    PatientService patientService,
  ) {
    final patient = MockData.patients.firstWhere(
      (p) => p.userId == appointment.patientId,
    );
    final patientUser = MockData.users.firstWhere(
      (u) => u.id == appointment.patientId,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.08),
            AppColors.chartBlue.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                // Patient Avatar
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        child: Text(
                          patientUser.fullName[0].toUpperCase(),
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.success,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                // Patient Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientUser.fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${patientService.calculateAge(patient.dateOfBirth)} yrs',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: 6),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.error.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.bloodtype,
                                    size: 11, color: AppColors.error),
                                SizedBox(width: 3),
                                Text(
                                  patient.bloodGroup,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.error,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Status Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.warning.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.alarm, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'NEXT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Time and Contact Info
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule,
                              size: 20, color: AppColors.primary),
                          SizedBox(width: 8),
                          Text(
                            appointment.timeSlot,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Icon(Icons.phone_rounded,
                              size: 18, color: AppColors.textSecondary),
                          SizedBox(width: 6),
                          Text(
                            patientUser.phone,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  if (appointment.reasonForVisit != null) ...[
                    SizedBox(height: 12),
                    Divider(height: 1, color: AppColors.divider),
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.notes,
                            size: 18, color: AppColors.chartOrange),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            appointment.reasonForVisit!,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            SizedBox(height: 16),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConsultationScreen(
                        appointment: appointment,
                        patient: patient,
                        patientUser: patientUser,
                        doctorUser: user,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.video_call_rounded, size: 22),
                label: Text(
                  'Start Consultation',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyAppointmentCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.textLight.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.event_available_rounded,
              size: 40,
              color: AppColors.textLight,
            ),
          ),
          SizedBox(height: 12),
          Text(
            'No upcoming appointments',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'You\'re all clear for today!',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 10),
          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: color,
              height: 1,
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImpactfulComparisonCard(
    String title,
    IconData icon,
    int thisMonth,
    int lastMonth,
    double percentageChange,
    Color color,
    String description,
  ) {
    final isIncrease = percentageChange >= 0;
    final changeColor = isIncrease ? AppColors.success : AppColors.error;
    final changeIcon =
        isIncrease ? Icons.trending_up_rounded : Icons.trending_down_rounded;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'This month',
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
                // Large Number
                Text(
                  thisMonth.toString(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: color,
                    height: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Comparison Section
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: changeColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: changeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      changeIcon,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${percentageChange.abs().toStringAsFixed(0)}%',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: changeColor,
                                height: 1,
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              isIncrease ? 'increase' : 'decrease',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: changeColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'vs last month ($lastMonth $description)',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMetric(
      IconData icon, String value, String label, Color color) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            height: 1,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Map<String, int> _calculateMonthStats(
      List<Appointment> appointments, DateTime month) {
    final monthAppointments = appointments.where((apt) {
      return apt.appointmentDate.year == month.year &&
          apt.appointmentDate.month == month.month &&
          apt.status == AppointmentStatus.completed;
    }).toList();

    final prescriptions = MockData.medicalRecords.where((record) {
      return record.visitDate.year == month.year &&
          record.visitDate.month == month.month;
    }).fold<int>(0, (sum, record) => sum + record.prescriptions.length);

    return {
      'appointments': monthAppointments.length,
      'prescriptions': prescriptions,
    };
  }

  double _calculatePercentageChange(int oldValue, int newValue) {
    if (oldValue == 0) {
      return newValue > 0 ? 100.0 : 0.0;
    }
    return ((newValue - oldValue) / oldValue) * 100;
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Morning';
    if (hour < 17) return 'Afternoon';
    return 'Evening';
  }
}
