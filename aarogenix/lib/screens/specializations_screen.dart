import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/mock_data.dart';

class DoctorsBySpecializationScreen extends StatelessWidget {
  final String specialization;

  const DoctorsBySpecializationScreen(
      {super.key, required this.specialization});

  @override
  Widget build(BuildContext context) {
    final doctors = MockData.doctors
        .where((doctor) =>
            doctor.specialization.toLowerCase() == specialization.toLowerCase())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$specialization Doctors'),
        backgroundColor: AppColors.primary,
      ),
      body: doctors.isEmpty
          ? Center(
              child: Text(
                'No doctors found for $specialization',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: doctors.length,
              separatorBuilder: (_, __) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                final user =
                    MockData.users.firstWhere((u) => u.id == doctor.userId);

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.fullName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 4),
                              Text(
                                doctor.qualification,
                                style: TextStyle(
                                    color: Colors.grey[700], fontSize: 14),
                              ),
                              SizedBox(height: 6),
                              Text(
                                doctor.hospitalName,
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 13),
                              ),
                              SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  SizedBox(width: 6),
                                  Text(
                                    '${doctor.rating} (${doctor.totalReviews} reviews)',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.watch_later,
                                      size: 16, color: Colors.grey[600]),
                                  SizedBox(width: 6),
                                  Text(
                                    'Experience: ${doctor.experienceYears} yrs',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today,
                                      size: 16, color: Colors.grey[600]),
                                  SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Available: ${doctor.availableDays.join(', ')}',
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[600]),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.access_time,
                                      size: 16, color: Colors.grey[600]),
                                  SizedBox(width: 6),
                                  Text(
                                    '${doctor.startTime} - ${doctor.endTime}',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[600]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '₹${doctor.consultationFee.toStringAsFixed(0)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to booking or doctor profile
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text("Booking currently not available"),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text('Book'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
