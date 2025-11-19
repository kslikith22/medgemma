// lib/screens/patient/patient_profile_tab.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aarogenix/service/auth_service.dart';
import 'package:aarogenix/service/patient_service.dart';

import '../../models/user.dart';

class PatientProfileTab extends StatefulWidget {
  final User user;
  final dynamic patient;
  final PatientService patientService;

  const PatientProfileTab({
    super.key,
    required this.user,
    required this.patient,
    required this.patientService,
  });

  @override
  State<PatientProfileTab> createState() => _PatientProfileTabState();
}

class _PatientProfileTabState extends State<PatientProfileTab> {
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 60,
            backgroundColor: Color(0xFF2C5364),
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            widget.user.fullName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.user.email,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          SizedBox(height: 30),
          _buildProfileInfoCard(widget.patient, widget.user),
          SizedBox(height: 16),
          _buildProfileOptionCard(context, 'Edit Profile', Icons.edit),
          _buildProfileOptionCard(context, 'Medical History', Icons.history),
          _buildProfileOptionCard(context, 'Settings', Icons.settings),
          _buildProfileOptionCard(context, 'Help & Support', Icons.help),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              _authService.logout();
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Text(
              "Logout",
              style: GoogleFonts.roboto(
                  color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileInfoCard(patient, User user) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoRow('Phone', user.phone),
            Divider(),
            _buildInfoRow('Blood Group', patient?.bloodGroup ?? 'N/A'),
            Divider(),
            _buildInfoRow(
              'Age',
              patient != null
                  ? '${widget.patientService.calculateAge(patient.dateOfBirth)} years'
                  : 'N/A',
            ),
            Divider(),
            _buildInfoRow(
              'Height',
              patient != null ? '${patient.height} cm' : 'N/A',
            ),
            Divider(),
            _buildInfoRow(
              'Weight',
              patient != null ? '${patient.weight} kg' : 'N/A',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOptionCard(
      BuildContext context, String title, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF2C5364)),
        title: Text(title),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title feature coming soon')),
          );
        },
      ),
    );
  }
}
