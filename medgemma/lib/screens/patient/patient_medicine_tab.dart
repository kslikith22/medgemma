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
        ? _emptyState()
        : ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: prescribedMedicines.length,
            separatorBuilder: (_, __) => const SizedBox(height: 14),
            itemBuilder: (context, i) =>
                _buildMedicineCard(prescribedMedicines[i]),
          );
  }

  // ---------------- EMPTY STATE ------------------

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medication_liquid_outlined,
                size: 80, color: AppColors.textLight),
            const SizedBox(height: 20),
            Text(
              'No prescribed medicines yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your doctor’s prescribed medicines will appear here.',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 15,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // -------------- MEDICINE CARD --------------------

  Widget _buildMedicineCard(PrescribedMedicine prescribed) {
    final medicine = MedicineMockData.medicines.firstWhere(
      (m) => m.id == prescribed.medicineId,
      orElse: () => Medicine(
        id: '',
        name: 'Unknown Medicine',
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
        fullName: 'Your Doctor',
        email: '',
        password: '',
        userType: UserType.doctor,
        phone: '',
        profileImage: '',
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: prescribed.isOrdered
              ? AppColors.success
              : AppColors.border.withOpacity(0.4),
          width: prescribed.isOrdered ? 1.2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------------
          // TOP ROW: MEDICINE NAME + "NEW" BADGE / CHECK ICON
          // ----------------------------------------------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.medication_rounded,
                    size: 28, color: AppColors.primary),
              ),

              const SizedBox(width: 12),

              // NAME + STRENGTH
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      medicine.strength,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // BADGE
              prescribed.isOrdered
                  ? Icon(Icons.check_circle, color: AppColors.success, size: 22)
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'NEW',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
            ],
          ),

          const SizedBox(height: 14),

          // ----------------------------------------------------------
          // DOCTOR + DATE
          // ----------------------------------------------------------
          Row(
            children: [
              Icon(Icons.person_outline,
                  size: 16, color: AppColors.textSecondary),
              const SizedBox(width: 6),
              Text(
                doctor.fullName,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
              ),
              const Spacer(),
              Icon(Icons.calendar_month, size: 16, color: AppColors.textLight),
              const SizedBox(width: 4),
              Text(
                '${prescribed.prescribedDate.day}/${prescribed.prescribedDate.month}/${prescribed.prescribedDate.year}',
                style: TextStyle(color: AppColors.textLight, fontSize: 13),
              ),
            ],
          ),

          const SizedBox(height: 10),
          Divider(color: AppColors.border.withOpacity(0.6)),
          const SizedBox(height: 10),

          // ----------------------------------------------------------
          // DOSAGE ROW
          // ----------------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoTile('Dosage', prescribed.dosage),
              _infoTile('Frequency', prescribed.frequency),
              _infoTile('Duration', '${prescribed.durationDays} days'),
            ],
          ),

          if (prescribed.instructions.isNotEmpty) ...[
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, size: 16, color: AppColors.primary),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    prescribed.instructions,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ],

          const SizedBox(height: 10),

          // ----------------------------------------------------------
          // PRICE + ACTION BUTTON
          // ----------------------------------------------------------
          Row(
            children: [
              Text(
                '₹${medicine.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              prescribed.isOrdered
                  ? _orderedButton()
                  : _orderNowButton(prescribed),
            ],
          )
        ],
      ),
    );
  }

  // ------------------ SMALL INFO BLOCK ------------------
  Widget _infoTile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        const SizedBox(height: 3),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  // ------------------ ORDER BUTTONS ------------------

  Widget _orderNowButton(PrescribedMedicine prescribed) {
    return ElevatedButton.icon(
      onPressed: () => _confirmOrder(prescribed),
      icon: const Icon(
        Icons.shopping_cart_outlined,
        size: 18,
        color: Colors.white,
      ),
      label: const Text('Order Now'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _orderedButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.receipt_long, size: 18, color: AppColors.success),
      label: Text(
        'Ordered',
        style: TextStyle(color: AppColors.success),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.success),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // ---------------- CONFIRM ORDER --------------------

  void _confirmOrder(PrescribedMedicine prescribed) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirm Order'),
        content: Text(
          'Order medicine: ${prescribed.medicineId}?',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
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
                    isOrdered: true, // 🔥 mark as ordered
                  );
                }
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Order placed!'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
