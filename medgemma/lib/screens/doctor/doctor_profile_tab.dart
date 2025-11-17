// lib/screens/doctor/doctor_profile_tab.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medgemma/service/auth_service.dart';

import '../../models/user.dart';

class DoctorProfileTab extends StatefulWidget {
  final User user;
  final dynamic doctor;

  const DoctorProfileTab({
    super.key,
    required this.user,
    required this.doctor,
  });

  @override
  State<DoctorProfileTab> createState() => _DoctorProfileTabState();
}

class _DoctorProfileTabState extends State<DoctorProfileTab> {
  final authService = AuthService();

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
            widget.doctor?.specialization ?? 'Medical Practitioner',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
          SizedBox(height: 30),
          if (widget.doctor != null)
            _buildDoctorInfoCard(widget.doctor, widget.user),
          SizedBox(height: 16),
          _buildProfileOptionCard(context, 'Edit Profile', Icons.edit),
          _buildProfileOptionCard(context, 'Schedule Settings', Icons.schedule),
          _buildProfileOptionCard(
              context, 'Consultation Settings', Icons.settings),
          _buildProfileOptionCard(context, 'Help & Support', Icons.help),
          SizedBox(height: 16),
          InkWell(
            onTap: () {
              authService.logout();
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

  Widget _buildDoctorInfoCard(doctor, User user) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildInfoRow('Phone', user.phone),
            Divider(),
            _buildInfoRow('Qualification', doctor.qualification),
            Divider(),
            _buildInfoRow('Experience', '${doctor.experienceYears} years'),
            Divider(),
            _buildInfoRow('Hospital', doctor.hospitalName),
            Divider(),
            _buildInfoRow('Consultation Fee', '₹${doctor.consultationFee}'),
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
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
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
