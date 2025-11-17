// lib/screens/patient/patient_appointments_tab.dart
import 'package:flutter/material.dart';
import 'package:medgemma/service/appointment_service.dart';

import '../../data/mock_data.dart';
import '../../models/appointment.dart';
import '../../models/doctor.dart';
import '../../models/user.dart';

class PatientAppointmentsTab extends StatelessWidget {
  final List<Appointment> appointments;
  final AppointmentService appointmentService;
  final VoidCallback onRefresh;

  const PatientAppointmentsTab({
    super.key,
    required this.appointments,
    required this.appointmentService,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final upcomingAppointments =
        appointmentService.getUpcomingAppointments(appointments);
    final pastAppointments =
        appointmentService.getPastAppointments(appointments);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.grey[200],
            child: TabBar(
              labelColor: Color(0xFF2C5364),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xFF2C5364),
              tabs: [
                Tab(text: 'Upcoming (${upcomingAppointments.length})'),
                Tab(text: 'Past (${pastAppointments.length})'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildAppointmentsList(context, upcomingAppointments,
                    isUpcoming: true),
                _buildAppointmentsList(context, pastAppointments,
                    isUpcoming: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsList(
      BuildContext context, List<Appointment> appointmentsList,
      {required bool isUpcoming}) {
    if (appointmentsList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isUpcoming ? Icons.event_available : Icons.history,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              isUpcoming ? 'No upcoming appointments' : 'No past appointments',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: appointmentsList.length,
      itemBuilder: (context, index) {
        final appointment = appointmentsList[index];
        final doctor = MockData.doctors.firstWhere(
          (d) => d.userId == appointment.doctorId,
        );
        final doctorUser = MockData.users.firstWhere(
          (u) => u.id == appointment.doctorId,
        );

        return _buildAppointmentCard(context, appointment, doctor, doctorUser,
            showActions: isUpcoming);
      },
    );
  }

  Widget _buildAppointmentCard(
    BuildContext context,
    Appointment appointment,
    Doctor doctor,
    User doctorUser, {
    bool showActions = false,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF2C5364),
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorUser.fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        doctor.specialization,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          SizedBox(width: 4),
                          Text(
                            '${doctor.rating} (${doctor.totalReviews} reviews)',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Color(0xFF2C5364)),
                SizedBox(width: 8),
                Text(
                  '${appointment.appointmentDate.day}/${appointment.appointmentDate.month}/${appointment.appointmentDate.year}',
                ),
                SizedBox(width: 24),
                Icon(Icons.access_time, size: 16, color: Color(0xFF2C5364)),
                SizedBox(width: 8),
                Text(appointment.timeSlot),
              ],
            ),
            if (appointment.reasonForVisit != null) ...[
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.note, size: 16, color: Color(0xFF2C5364)),
                  SizedBox(width: 8),
                  Expanded(child: Text(appointment.reasonForVisit!)),
                ],
              ),
            ],
            if (showActions) ...[
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Reschedule feature coming soon')),
                        );
                      },
                      icon: Icon(Icons.edit_calendar),
                      label: Text('Reschedule'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF2C5364),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showCancelDialog(context, appointment.id);
                      },
                      icon: Icon(Icons.cancel),
                      label: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showCancelDialog(BuildContext context, String appointmentId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cancel Appointment'),
        content: Text('Are you sure you want to cancel this appointment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () async {
              await appointmentService.cancelAppointment(appointmentId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Appointment cancelled successfully')),
              );
              onRefresh();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Yes, Cancel'),
          ),
        ],
      ),
    );
  }
}
