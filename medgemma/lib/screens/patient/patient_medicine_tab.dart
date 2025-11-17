// lib/screens/patient/patient_medicine_tab.dart
import 'package:flutter/material.dart';
import 'package:medgemma/core/theme/app_colors.dart';
import 'package:medgemma/models/user_type.dart';

import '../../data/medicine_mock_data.dart';
import '../../data/mock_data.dart';
import '../../models/medicine.dart';
import '../../models/user.dart';

class PatientMedicineTab extends StatefulWidget {
  final User patient;

  const PatientMedicineTab({
    super.key,
    required this.patient,
  });

  @override
  State<PatientMedicineTab> createState() => _PatientMedicineTabState();
}

class _PatientMedicineTabState extends State<PatientMedicineTab> {
  @override
  Widget build(BuildContext context) {
    final prescribedMedicines = MedicineMockData.prescribedMedicines
        .where((pm) => pm.patientId == widget.patient.id)
        .toList()
      ..sort((a, b) => b.prescribedDate.compareTo(a.prescribedDate));

    return prescribedMedicines.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.medication_outlined,
                  size: 80,
                  color: AppColors.textLight,
                ),
                SizedBox(height: 16),
                Text(
                  'No prescribed medicines',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your doctor-recommended medicines will appear here.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: prescribedMedicines.length,
            separatorBuilder: (_, __) => SizedBox(height: 12),
            itemBuilder: (context, i) {
              final prescribed = prescribedMedicines[i];
              final medicine = MedicineMockData.medicines.firstWhere(
                (m) => m.id == prescribed.medicineId,
                orElse: () => Medicine(
                  id: '',
                  name: 'Unknown',
                  subcategoryId: '',
                  manufacturer: '',
                  description: '',
                  price: 0,
                  strength: '',
                  packSize: '',
                  requiresPrescription: true,
                  imageUrl: '',
                  uses: [],
                  sideEffects: [],
                ),
              );
              final doctor = MockData.users.firstWhere(
                (u) => u.id == prescribed.doctorId,
                orElse: () => User(
                  id: '',
                  fullName: 'Doctor',
                  email: '',
                  password: '',
                  userType: UserType.doctor,
                  phone: '',
                  profileImage: '',
                ),
              );

              return Card(
                color: prescribed.isOrdered
                    ? AppColors.success.withOpacity(0.05)
                    : AppColors.cardBackground,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: prescribed.isOrdered
                      ? BorderSide(color: AppColors.success, width: 1)
                      : BorderSide.none,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Medicine title and subtitle
                      Row(
                        children: [
                          Icon(Icons.medication,
                              color: AppColors.primary, size: 30),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  medicine.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  medicine.strength,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!prescribed.isOrdered)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.chartPurple.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'NEW',
                                style: TextStyle(
                                  color: AppColors.chartPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            )
                          else
                            Icon(Icons.check_circle, color: AppColors.success)
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.person_outline,
                              size: 16, color: AppColors.textSecondary),
                          SizedBox(width: 4),
                          Text(
                            doctor.fullName,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.schedule,
                              size: 15, color: AppColors.textLight),
                          Text(
                            ' ${prescribed.prescribedDate.day}/${prescribed.prescribedDate.month}/${prescribed.prescribedDate.year}',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textLight,
                            ),
                          )
                        ],
                      ),
                      Divider(height: 18),
                      // Prescription details
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _smallInfo('Dosage', prescribed.dosage),
                          _smallInfo('Frequency', prescribed.frequency),
                          _smallInfo('Days', '${prescribed.durationDays}')
                        ],
                      ),
                      if (prescribed.instructions.isNotEmpty) ...[
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.info,
                                size: 14, color: AppColors.chartBlue),
                            SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                prescribed.instructions,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: 14),
                      // Price and Action
                      Row(
                        children: [
                          Text(
                            '₹${medicine.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          Spacer(),
                          if (!prescribed.isOrdered)
                            ElevatedButton.icon(
                              onPressed: () => _confirmOrder(prescribed),
                              icon:
                                  Icon(Icons.shopping_cart_outlined, size: 17),
                              label: Text('Order Now'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.textWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            )
                          else
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.receipt_long, size: 17),
                              label: Text('Ordered'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.success,
                                side: BorderSide(color: AppColors.success),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  Widget _smallInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 11, color: AppColors.textLight),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        )
      ],
    );
  }

  void _confirmOrder(PrescribedMedicine prescribed) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Order Medicine'),
        content: Text('Confirm order for ${prescribed.medicineId}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                final idx = MedicineMockData.prescribedMedicines.indexWhere(
                  (pm) => pm.id == prescribed.id,
                );
                if (idx != -1) {
                  MedicineMockData.prescribedMedicines[idx] =
                      PrescribedMedicine(
                    id: prescribed.id,
                    medicineId: prescribed.medicineId,
                    patientId: prescribed.patientId,
                    doctorId: prescribed.doctorId,
                    dosage: prescribed.dosage,
                    frequency: prescribed.frequency,
                    durationDays: prescribed.durationDays,
                    instructions: prescribed.instructions,
                    prescribedDate: prescribed.prescribedDate,
                    isOrdered: true,
                  );
                }
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Order placed!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
