import 'package:flutter/material.dart';
import 'package:aarogenix/core/theme/app_colors.dart';

import '../../data/medicine_mock_data.dart';
import '../../models/medicine.dart';
import '../../models/user.dart';

class MedicineDetailScreen extends StatefulWidget {
  final Medicine medicine;
  final User? patient;
  final User doctor;
  final bool
      isPatientView; // true if individual patient user buying independently

  const MedicineDetailScreen({
    super.key,
    required this.medicine,
    this.patient,
    required this.doctor,
    this.isPatientView = false,
  });

  @override
  State<MedicineDetailScreen> createState() => _MedicineDetailScreenState();
}

class _MedicineDetailScreenState extends State<MedicineDetailScreen> {
  final _dosageController = TextEditingController();
  final _frequencyController = TextEditingController();
  final _durationController = TextEditingController();
  final _instructionsController = TextEditingController();

  @override
  void dispose() {
    _dosageController.dispose();
    _frequencyController.dispose();
    _durationController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _prescribeMedicine() {
    if (widget.patient == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a patient first'),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }
    if (_dosageController.text.isEmpty ||
        _frequencyController.text.isEmpty ||
        _durationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all prescription details'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    final prescribed = PrescribedMedicine(
      id: 'PM${DateTime.now().millisecondsSinceEpoch}',
      medicineId: widget.medicine.id,
      patientId: widget.patient!.id,
      doctorId: widget.doctor.id,
      dosage: _dosageController.text,
      frequency: _frequencyController.text,
      durationDays: int.parse(_durationController.text),
      instructions: _instructionsController.text,
      prescribedDate: DateTime.now(),
    );

    MedicineMockData.prescribedMedicines.add(prescribed);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Medicine prescribed successfully'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isIndividualBuyer = widget.isPatientView || widget.patient == null;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Medicine Details'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with medicine icon and name
            Center(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.medication,
                      color: AppColors.primary,
                      size: 80,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.medicine.name,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    widget.medicine.manufacturer,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _infoChip(widget.medicine.strength, Icons.science),
                      SizedBox(width: 10),
                      _infoChip(widget.medicine.packSize, Icons.inventory_2),
                      if (widget.medicine.requiresPrescription) ...[
                        SizedBox(width: 10),
                        _infoChip('Rx Required', Icons.medical_services,
                            color: AppColors.warning),
                      ],
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '₹${widget.medicine.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Description section
            _sectionWithContent('Description', widget.medicine.description),

            SizedBox(height: 24),

            // Uses list
            _listSection('Uses', widget.medicine.uses, Icons.check_circle,
                AppColors.success),

            SizedBox(height: 24),

            // Side effects list
            _listSection('Side Effects', widget.medicine.sideEffects,
                Icons.warning_amber, AppColors.warning),

            if (!isIndividualBuyer) ...[
              SizedBox(height: 30),
              _prescriptionForm(),
            ],

            if (isIndividualBuyer) ...[
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added to cart'),
                        backgroundColor: AppColors.success,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text('Add to Cart',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textWhite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 4,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoChip(String text, IconData icon, {Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: (color ?? AppColors.primary).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color ?? AppColors.primary),
          SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color ?? AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionWithContent(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(title),
        SizedBox(height: 8),
        Card(
          color: AppColors.cardBackground,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              content,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listSection(
      String title, List<String> items, IconData icon, Color iconColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(title),
        SizedBox(height: 8),
        Card(
          color: AppColors.cardBackground,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: items
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Icon(icon, size: 18, color: iconColor),
                          SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              item,
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _prescriptionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader('Prescription Details'),
        SizedBox(height: 14),
        Card(
          color: AppColors.cardBackground,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                _inputField(_dosageController, 'Dosage', 'e.g., 1 tablet'),
                SizedBox(height: 14),
                _inputField(
                    _frequencyController, 'Frequency', 'e.g., Twice daily'),
                SizedBox(height: 14),
                _inputField(_durationController, 'Duration (days)', 'e.g., 7',
                    keyboardType: TextInputType.number),
                SizedBox(height: 14),
                _inputField(_instructionsController, 'Instructions',
                    'e.g., Take after meals with water',
                    maxLines: 3),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _prescribeMedicine,
                    icon: Icon(Icons.add_circle_outline),
                    label: Text(
                      'Prescribe Medicine',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textWhite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputField(
      TextEditingController controller, String label, String hint,
      {int maxLines = 1, TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) => Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColors.textPrimary,
        ),
      );
}
