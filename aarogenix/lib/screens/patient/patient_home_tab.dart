// lib/screens/patient/patient_home_tab.dart
import 'package:flutter/material.dart';
import 'package:aarogenix/screens/ecg_upload_card.dart';
import 'package:aarogenix/screens/specializations_screen.dart';
import 'package:aarogenix/service/appointment_service.dart';
import 'package:aarogenix/service/patient_service.dart';

import '../../data/mock_data.dart';
import '../../models/appointment.dart';
import '../../models/doctor.dart';
import '../../models/user.dart';

class PatientHomeTab extends StatelessWidget {
  final User user;
  final dynamic patient;
  final List<Appointment> appointments;
  final AppointmentService appointmentService;
  final PatientService patientService;
  final Function(int) onTabChange;

  const PatientHomeTab({
    super.key,
    required this.user,
    required this.patient,
    required this.appointments,
    required this.appointmentService,
    required this.patientService,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    final upcomingAppointments =
        appointmentService.getUpcomingAppointments(appointments);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  user.fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    _buildHealthCard(
                      'Blood Group',
                      patient?.bloodGroup ?? 'N/A',
                      Icons.bloodtype,
                    ),
                    SizedBox(width: 12),
                    _buildHealthCard(
                      'Age',
                      patient != null
                          ? '${patientService.calculateAge(patient.dateOfBirth)} yrs'
                          : 'N/A',
                      Icons.cake,
                    ),
                  ],
                ),
              ],
            ),
          ),

          EcgUploadPromoCard(
            onTap: () {
              Navigator.pushNamed(context, '/ecg-upload-analysis');
            },
          ),
          // Upcoming Appointments
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () => onTabChange(1),
                  child: Text('View All'),
                ),
              ],
            ),
          ),

          if (upcomingAppointments.isEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.event_available,
                            size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'No upcoming appointments',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: upcomingAppointments.length > 2
                  ? 2
                  : upcomingAppointments.length,
              itemBuilder: (context, index) {
                final appointment = upcomingAppointments[index];
                final doctor = MockData.doctors.firstWhere(
                  (d) => d.userId == appointment.doctorId,
                );
                final doctorUser = MockData.users.firstWhere(
                  (u) => u.id == appointment.doctorId,
                );

                return _buildAppointmentCard(appointment, doctor, doctorUser);
              },
            ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    'Total Appointments',
                    appointments.length.toString(),
                    Icons.calendar_month,
                    Colors.blue,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    'Upcoming',
                    upcomingAppointments.length.toString(),
                    Icons.upcoming,
                    Colors.orange,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Find Doctors
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Find Doctors by Specialization',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12),

          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildSpecializationCard(
                    context, 'Cardiologist', Icons.favorite, Colors.red),
                _buildSpecializationCard(
                    context, 'Pediatrician', Icons.child_care, Colors.blue),
                _buildSpecializationCard(context, 'Orthopedic',
                    Icons.accessibility_new, Colors.green),
                _buildSpecializationCard(
                    context, 'Dentist', Icons.medical_services, Colors.orange),
              ],
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildHealthCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(
    Appointment appointment,
    Doctor doctor,
    User doctorUser,
  ) {
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
          ],
        ),
      ),
    );
  }

  Widget _buildSpecializationCard(
      BuildContext context, String title, IconData icon, Color color) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    DoctorsBySpecializationScreen(specialization: title),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: color),
                SizedBox(height: 8),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
