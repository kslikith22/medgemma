// lib/screens/doctor/doctor_appointments_tab.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medgemma/core/theme/app_colors.dart';
import 'package:medgemma/models/user_type.dart';
import 'package:medgemma/screens/doctor/consultation_screen.dart';
import 'package:medgemma/service/patient_service.dart';

import '../../data/mock_data.dart';
import '../../models/appointment.dart';
import '../../models/patient.dart';
import '../../models/user.dart';

class DoctorAppointmentsTab extends StatelessWidget {
  final List<Appointment> appointments;
  final PatientService patientService;

  const DoctorAppointmentsTab({
    super.key,
    required this.appointments,
    required this.patientService,
  });

  @override
  Widget build(BuildContext context) {
    final todayAppointments = appointments.where((apt) {
      final now = DateTime.now();
      return apt.appointmentDate.day == now.day &&
          apt.appointmentDate.month == now.month &&
          apt.appointmentDate.year == now.year;
    }).toList()
      ..sort((a, b) => a.appointmentDate.compareTo(b.appointmentDate));

    final upcomingAppointments = appointments.where((apt) {
      final now = DateTime.now();
      return apt.appointmentDate.isAfter(now) &&
          apt.status == AppointmentStatus.scheduled;
    }).toList()
      ..sort((a, b) => a.appointmentDate.compareTo(b.appointmentDate));

    final completedAppointments = appointments
        .where((apt) => apt.status == AppointmentStatus.completed)
        .toList()
      ..sort((a, b) => b.appointmentDate.compareTo(a.appointmentDate));

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Material(
            color: Colors.white,
            elevation: 1,
            child: TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              indicatorColor: AppColors.primary,
              indicatorWeight: 3,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Today'),
                      SizedBox(width: 6),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${todayAppointments.length}',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Upcoming'),
                      SizedBox(width: 6),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.chartOrange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${upcomingAppointments.length}',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Past'),
                      SizedBox(width: 6),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${completedAppointments.length}',
                          style: TextStyle(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildTimelineView(context, todayAppointments, isToday: true),
                _buildTimelineView(context, upcomingAppointments,
                    isUpcoming: true),
                _buildTimelineView(context, completedAppointments,
                    isPast: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineView(
    BuildContext context,
    List<Appointment> appointmentsList, {
    bool isToday = false,
    bool isUpcoming = false,
    bool isPast = false,
  }) {
    if (appointmentsList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isToday
                    ? Icons.today_outlined
                    : isPast
                        ? Icons.history
                        : Icons.event_available,
                size: 48,
                color: AppColors.textLight,
              ),
            ),
            SizedBox(height: 16),
            Text(
              isToday
                  ? 'No appointments today'
                  : isPast
                      ? 'No past appointments'
                      : 'No upcoming appointments',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6),
            Text(
              isToday ? 'You\'re all clear!' : 'Check back later',
              style: TextStyle(
                color: AppColors.textLight,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: appointmentsList.length,
      itemBuilder: (context, index) {
        final appointment = appointmentsList[index];
        final patient = MockData.patients.firstWhere(
          (p) => p.userId == appointment.patientId,
        );
        final patientUser = MockData.users.firstWhere(
          (u) => u.id == appointment.patientId,
        );

        return _buildTimelineCard(
          context,
          appointment,
          patient,
          patientUser,
          isToday: isToday,
          isUpcoming: isUpcoming,
          isPast: isPast,
          isFirst: index == 0,
          isLast: index == appointmentsList.length - 1,
        );
      },
    );
  }

  Widget _buildTimelineCard(
    BuildContext context,
    Appointment appointment,
    Patient patient,
    User patientUser, {
    required bool isToday,
    required bool isUpcoming,
    required bool isPast,
    required bool isFirst,
    required bool isLast,
  }) {
    final showActions =
        !isPast && appointment.status == AppointmentStatus.scheduled;
    final timeColor = isToday
        ? AppColors.primary
        : isPast
            ? AppColors.textLight
            : AppColors.chartOrange;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              // Top line
              if (!isFirst)
                Container(
                  width: 2,
                  height: 12,
                  color: timeColor.withOpacity(0.3),
                ),
              // Time dot
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: timeColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: timeColor.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              // Bottom line
              Expanded(
                child: Container(
                  width: 2,
                  color:
                      isLast ? Colors.transparent : timeColor.withOpacity(0.3),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),

          // Time Label
          Container(
            width: 70,
            padding: EdgeInsets.only(top: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _extractTime(appointment.timeSlot),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: timeColor,
                    height: 1,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '${appointment.appointmentDate.day}/${appointment.appointmentDate.month}',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),

          // Card Content
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isPast
                      ? AppColors.divider
                      : isToday
                          ? AppColors.primary.withOpacity(0.3)
                          : AppColors.chartOrange.withOpacity(0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Patient Info
                  Padding(
                    padding: EdgeInsets.all(14),
                    child: Row(
                      children: [
                        // Avatar
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: timeColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              patientUser.fullName[0].toUpperCase(),
                              style: TextStyle(
                                color: timeColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        // Name and Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patientUser.fullName,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              SizedBox(height: 3),
                              Row(
                                children: [
                                  Text(
                                    '${patientService.calculateAge(patient.dateOfBirth)} y',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Container(
                                    width: 3,
                                    height: 3,
                                    decoration: BoxDecoration(
                                      color: AppColors.textLight,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    patient.bloodGroup,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Status Badge
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getStatusColor(appointment.status)
                                .withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _getStatusText(appointment.status),
                            style: TextStyle(
                              color: _getStatusColor(appointment.status),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Reason for Visit
                  if (appointment.reasonForVisit != null)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.note_outlined,
                            size: 14,
                            color: AppColors.textSecondary,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              appointment.reasonForVisit!,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                  // Actions
                  if (showActions) ...[
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConsultationScreen(
                                      appointment: appointment,
                                      patient: patient,
                                      patientUser: patientUser,
                                      doctorUser: MockData.users.firstWhere(
                                        (u) => u.userType == UserType.doctor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                size: 18,
                                color: Colors.white,
                              ),
                              label: Text('Start'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () =>
                                  _showRescheduleDialog(context, appointment),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.chartOrange,
                                side: BorderSide(color: AppColors.chartOrange),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Icon(Icons.schedule, size: 18),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () =>
                                  _showCancelDialog(context, appointment),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.error,
                                side: BorderSide(color: AppColors.error),
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Icon(Icons.close, size: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else if (isPast)
                    Padding(
                      padding: EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.description_outlined, size: 16),
                        label: Text('View Details'),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.textSecondary,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _extractTime(String timeSlot) {
    // Extract first time from slot like "09:00 AM - 09:30 AM"
    return timeSlot.split('-')[0].trim();
  }

  void _showRescheduleDialog(BuildContext context, Appointment appointment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reschedule Appointment'),
        content: Text('Would you like to reschedule this appointment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.roboto(color: AppColors.chartOrange),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Rescheduling feature coming soon'),
                  backgroundColor: AppColors.chartOrange,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.chartOrange,
                foregroundColor: Colors.white),
            child: Text('Reschedule'),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(BuildContext context, Appointment appointment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cancel Appointment'),
        content: Text('Are you sure you want to cancel this appointment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'No',
              style: GoogleFonts.roboto(color: AppColors.error),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Appointment cancelled'),
                  backgroundColor: AppColors.error,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.scheduled:
        return AppColors.primary;
      case AppointmentStatus.completed:
        return AppColors.success;
      case AppointmentStatus.cancelled:
        return AppColors.error;
      case AppointmentStatus.rescheduled:
        return AppColors.chartOrange;
    }
  }

  String _getStatusText(AppointmentStatus status) {
    switch (status) {
      case AppointmentStatus.scheduled:
        return 'Scheduled';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.rescheduled:
        return 'Rescheduled';
    }
  }
}
