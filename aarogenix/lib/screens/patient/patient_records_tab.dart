// lib/screens/patient/patient_records_tab.dart
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../data/mock_data.dart';

class PatientRecordsTab extends StatelessWidget {
  final User user;

  const PatientRecordsTab({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final records = MockData.medicalRecords
        .where((record) => record.patientId == user.id)
        .toList();

    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_open, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No medical records available',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        final doctor = MockData.users.firstWhere((u) => u.id == record.doctorId);

        return Card(
          margin: EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Visit Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${record.visitDate.day}/${record.visitDate.month}/${record.visitDate.year}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.person, size: 16, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(doctor.fullName),
                  ],
                ),
                SizedBox(height: 8),
                Divider(),
                SizedBox(height: 8),
                Text(
                  'Diagnosis',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C5364),
                  ),
                ),
                SizedBox(height: 4),
                Text(record.diagnosis),
                SizedBox(height: 12),
                Text(
                  'Prescriptions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C5364),
                  ),
                ),
                SizedBox(height: 4),
                ...record.prescriptions.map((med) => Padding(
                      padding: EdgeInsets.only(left: 8, top: 4),
                      child: Row(
                        children: [
                          Icon(Icons.medication, size: 16, color: Colors.green),
                          SizedBox(width: 8),
                          Expanded(child: Text(med)),
                        ],
                      ),
                    )),
                if (record.notes != null) ...[
                  SizedBox(height: 12),
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C5364),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    record.notes!,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
