// lib/screens/doctor/doctor_patients_tab.dart
import 'package:flutter/material.dart';
import 'package:aarogenix/service/patient_service.dart';

import '../../data/mock_data.dart';
import '../../models/appointment.dart';
import '../../models/patient.dart';
import '../../models/user.dart';

class DoctorPatientsTab extends StatelessWidget {
  final List<Appointment> appointments;
  final PatientService patientService;

  const DoctorPatientsTab({
    super.key,
    required this.appointments,
    required this.patientService,
  });

  @override
  Widget build(BuildContext context) {
    final uniquePatientIds =
        appointments.map((apt) => apt.patientId).toSet().toList();

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: uniquePatientIds.length,
      itemBuilder: (context, index) {
        final patientId = uniquePatientIds[index];
        final patient =
            MockData.patients.firstWhere((p) => p.userId == patientId);
        final patientUser = MockData.users.firstWhere((u) => u.id == patientId);
        final patientAppointments =
            appointments.where((apt) => apt.patientId == patientId).length;

        return InkWell(
          onTap: () {
            _showPatientDetails(context, patientUser, patient);
          },
          child: Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 2,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFF2C5364),
                child: Text(
                  patientUser.fullName[0].toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                patientUser.fullName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                      '${patientService.calculateAge(patient.dateOfBirth)} years • ${patient.bloodGroup}'),
                  SizedBox(height: 4),
                  Text(
                    '$patientAppointments appointments',
                    style: TextStyle(color: Color(0xFF2C5364)),
                  ),
                ],
              ),
              trailing: Icon(Icons.chevron_right, color: Color(0xFF2C5364)),
            ),
          ),
        );
      },
    );
  }

  void _showPatientDetails(
      BuildContext context, User patientUser, Patient patient) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF2C5364),
                  child: Text(
                    patientUser.fullName[0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  patientUser.fullName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C5364),
                ),
              ),
              SizedBox(height: 12),
              _buildDetailRow('Age',
                  '${patientService.calculateAge(patient.dateOfBirth)} years'),
              _buildDetailRow('Blood Group', patient.bloodGroup),
              _buildDetailRow('Height', '${patient.height} cm'),
              _buildDetailRow('Weight', '${patient.weight} kg'),
              _buildDetailRow('Phone', patientUser.phone),
              _buildDetailRow('Email', patientUser.email),
              _buildDetailRow('Emergency Contact', patient.emergencyContact),
              SizedBox(height: 20),
              Text(
                'Medical Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C5364),
                ),
              ),
              SizedBox(height: 12),
              if (patient.allergies.isNotEmpty) ...[
                Text(
                  'Allergies:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                ...patient.allergies.map((allergy) => Padding(
                      padding: EdgeInsets.only(left: 16, top: 4),
                      child: Row(
                        children: [
                          Icon(Icons.warning, size: 16, color: Colors.red),
                          SizedBox(width: 8),
                          Text(allergy),
                        ],
                      ),
                    )),
                SizedBox(height: 12),
              ],
              if (patient.chronicConditions.isNotEmpty) ...[
                Text(
                  'Chronic Conditions:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                ...patient.chronicConditions.map((condition) => Padding(
                      padding: EdgeInsets.only(left: 16, top: 4),
                      child: Row(
                        children: [
                          Icon(Icons.medical_information,
                              size: 16, color: Colors.orange),
                          SizedBox(width: 8),
                          Text(condition),
                        ],
                      ),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
