// lib/screens/doctor/consultation_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aarogenix/core/theme/app_colors.dart';
import 'package:aarogenix/screens/medicine_store_screen.dart';
import 'package:aarogenix/service/appointment_service.dart';
import 'package:aarogenix/service/patient_service.dart';

import '../../data/medicine_mock_data.dart';
import '../../data/mock_data.dart';
import '../../models/appointment.dart';
import '../../models/medical_record.dart';
import '../../models/patient.dart';
import '../../models/user.dart';

class ConsultationScreen extends StatefulWidget {
  final Appointment appointment;
  final Patient patient;
  final User patientUser;
  final User doctorUser;

  const ConsultationScreen({
    super.key,
    required this.appointment,
    required this.patient,
    required this.patientUser,
    required this.doctorUser,
  });

  @override
  State<ConsultationScreen> createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _patientService = PatientService();
  final _appointmentService = AppointmentService();

  // Form controllers
  final _diagnosisController = TextEditingController();
  final _notesController = TextEditingController();
  final _prescriptionController = TextEditingController();
  final List<String> _prescriptions = [];

  bool _isConsultationActive = false;
  DateTime? _consultationStartTime;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _diagnosisController.dispose();
    _notesController.dispose();
    _prescriptionController.dispose();
    super.dispose();
  }

  void _startConsultation() {
    setState(() {
      _isConsultationActive = true;
      _consultationStartTime = DateTime.now();
    });
  }

  void _addPrescription() {
    if (_prescriptionController.text.trim().isNotEmpty) {
      setState(() {
        _prescriptions.add(_prescriptionController.text.trim());
        _prescriptionController.clear();
      });
    }
  }

  void _removePrescription(int index) {
    setState(() {
      _prescriptions.removeAt(index);
    });
  }

  Future<void> _completeConsultation() async {
    if (_diagnosisController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter diagnosis'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // Collect all prescriptions (manual + from store)
    final allPrescriptions = List<String>.from(_prescriptions);

    // Add medicines from store
    final storePrescribedMedicines = MedicineMockData.prescribedMedicines
        .where((pm) =>
            pm.patientId == widget.patientUser.id &&
            pm.doctorId == widget.doctorUser.id &&
            _consultationStartTime != null &&
            pm.prescribedDate.isAfter(_consultationStartTime!))
        .toList();

    for (var prescribed in storePrescribedMedicines) {
      final medicine = MedicineMockData.medicines.firstWhere(
        (m) => m.id == prescribed.medicineId,
      );
      allPrescriptions.add(
          '${medicine.name} ${medicine.strength} - ${prescribed.dosage} ${prescribed.frequency} for ${prescribed.durationDays} days');
    }

    // Create medical record
    final newRecord = MedicalRecord(
      id: 'MR${DateTime.now().millisecondsSinceEpoch}',
      patientId: widget.patientUser.id,
      doctorId: widget.doctorUser.id,
      visitDate: DateTime.now(),
      diagnosis: _diagnosisController.text.trim(),
      prescriptions: allPrescriptions,
      notes: _notesController.text.trim().isNotEmpty
          ? _notesController.text.trim()
          : null,
    );

    // Add to mock data
    MockData.medicalRecords.add(newRecord);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Consultation completed successfully'),
        backgroundColor: AppColors.success,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final medicalHistory = MockData.medicalRecords
        .where((record) => record.patientId == widget.patientUser.id)
        .toList()
      ..sort((a, b) => b.visitDate.compareTo(a.visitDate));

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Consultation'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
        elevation: 0,
        actions: [
          if (_isConsultationActive)
            TextButton.icon(
              onPressed: _completeConsultation,
              icon:
                  Icon(Icons.check_circle_outline, color: AppColors.textWhite),
              label: Text(
                'Complete',
                style: TextStyle(color: AppColors.textWhite),
              ),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.textWhite,
          labelColor: AppColors.textWhite,
          unselectedLabelColor: AppColors.textWhite.withOpacity(0.6),
          tabs: [
            Tab(text: 'Patient Info'),
            Tab(text: 'History'),
            Tab(text: 'Consultation'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPatientInfoTab(),
          _buildHistoryTab(medicalHistory),
          _buildConsultationTab(),
        ],
      ),
    );
  }

  Widget _buildPatientInfoTab() {
    final age = _patientService.calculateAge(widget.patient.dateOfBirth);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Patient Header Card
          Card(
            color: AppColors.cardBackground,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: Text(
                      widget.patientUser.fullName[0].toUpperCase(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    widget.patientUser.fullName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildInfoChip(Icons.cake, '$age years'),
                      SizedBox(width: 12),
                      _buildInfoChip(
                          Icons.bloodtype, widget.patient.bloodGroup),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Contact Information
          _buildSectionHeader('Contact Information'),
          SizedBox(height: 12),
          Card(
            color: AppColors.cardBackground,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoRow(Icons.phone, 'Phone', widget.patientUser.phone),
                  Divider(color: AppColors.divider),
                  _buildInfoRow(Icons.email, 'Email', widget.patientUser.email),
                  Divider(color: AppColors.divider),
                  _buildInfoRow(Icons.emergency, 'Emergency Contact',
                      widget.patient.emergencyContact),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),

          // Vital Statistics
          _buildSectionHeader('Vital Statistics'),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                    'Height', '${widget.patient.height} cm', Icons.height),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard('Weight', '${widget.patient.weight} kg',
                    Icons.monitor_weight),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Medical Conditions
          if (widget.patient.allergies.isNotEmpty) ...[
            _buildSectionHeader('Allergies'),
            SizedBox(height: 12),
            Card(
              color: AppColors.error.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: widget.patient.allergies.map((allergy) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.warning, color: AppColors.error, size: 20),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              allergy,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],

          if (widget.patient.chronicConditions.isNotEmpty) ...[
            _buildSectionHeader('Chronic Conditions'),
            SizedBox(height: 12),
            Card(
              color: AppColors.warning.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: widget.patient.chronicConditions.map((condition) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Icon(Icons.medical_information,
                              color: AppColors.warning, size: 20),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              condition,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHistoryTab(List<MedicalRecord> records) {
    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.folder_open, size: 64, color: AppColors.textLight),
            SizedBox(height: 16),
            Text(
              'No medical history available',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 16),
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
        final doctor =
            MockData.users.firstWhere((u) => u.id == record.doctorId);

        return Card(
          color: AppColors.cardBackground,
          margin: EdgeInsets.only(bottom: 16),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(16),
              childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.medical_services, color: AppColors.primary),
              ),
              title: Text(
                record.diagnosis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today,
                        size: 14, color: AppColors.textSecondary),
                    SizedBox(width: 4),
                    Text(
                      '${record.visitDate.day}/${record.visitDate.month}/${record.visitDate.year}',
                      style: TextStyle(
                          color: AppColors.textSecondary, fontSize: 13),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.person,
                        size: 14, color: AppColors.textSecondary),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        doctor.fullName,
                        style: TextStyle(
                            color: AppColors.textSecondary, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              children: [
                Divider(color: AppColors.divider),
                SizedBox(height: 12),
                if (record.labResults != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lab Results',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      record.labResults!,
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ),
                  SizedBox(height: 12),
                ],
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Prescriptions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ...record.prescriptions.map((prescription) => Container(
                      margin: EdgeInsets.only(bottom: 8),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: AppColors.success.withOpacity(0.3)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.medication,
                              size: 18, color: AppColors.success),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              prescription,
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                          ),
                        ],
                      ),
                    )),
                if (record.notes != null) ...[
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Notes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      record.notes!,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConsultationTab() {
    if (!_isConsultationActive) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.video_call,
                size: 80,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Ready to start consultation?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Review patient information before starting',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _startConsultation,
              icon: Icon(Icons.play_arrow, size: 24),
              label: Text('Start Consultation', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textWhite,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Diagnosis Section
          _buildSectionHeader('Diagnosis'),
          SizedBox(height: 12),
          TextField(
            controller: _diagnosisController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter diagnosis...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              filled: true,
              fillColor: AppColors.cardBackground,
            ),
          ),

          SizedBox(height: 24),

          // Manual Prescriptions Section
          _buildSectionHeader('Manual Prescriptions'),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _prescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Medicine name, dosage, frequency',
                    hintStyle: GoogleFonts.roboto(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                    filled: true,
                    fillColor: AppColors.cardBackground,
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                onPressed: _addPrescription,
                icon: Icon(Icons.add_circle),
                color: AppColors.primary,
                iconSize: 36,
              ),
            ],
          ),

          if (_prescriptions.isNotEmpty) ...[
            SizedBox(height: 16),
            ..._prescriptions.asMap().entries.map((entry) {
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.success.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.medication, size: 18, color: AppColors.success),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        entry.value,
                        style: TextStyle(color: AppColors.textPrimary),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _removePrescription(entry.key),
                      icon: Icon(Icons.close),
                      color: AppColors.error,
                      iconSize: 20,
                    ),
                  ],
                ),
              );
            }),
          ],

          SizedBox(height: 24),

          // Medicine Store Access Button
          _buildSectionHeader('Add Medicines from Store'),
          SizedBox(height: 12),
          Card(
            color: AppColors.cardBackground,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineStoreScreen(
                      patient: widget.patientUser,
                      doctor: widget.doctorUser,
                      isPatientView: false,
                      fromConsulation: true,
                    ),
                  ),
                ).then((_) {
                  // Refresh to show newly prescribed medicines
                  setState(() {});
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                          Icon(Icons.store, color: AppColors.success, size: 24),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Browse Medicine Store',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Add medicines from our comprehensive catalog',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          // Show Currently Prescribed Medicines from Store
          _buildCurrentlyPrescribedMedicines(),

          SizedBox(height: 24),

          // Notes Section
          _buildSectionHeader('Additional Notes'),
          SizedBox(height: 12),
          TextField(
            controller: _notesController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText:
                  'Enter any additional notes, recommendations, or follow-up instructions...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              filled: true,
              fillColor: AppColors.cardBackground,
            ),
          ),

          SizedBox(height: 24),

          // Schedule Follow-up Section
          _buildSectionHeader('Schedule Follow-up Appointment'),
          SizedBox(height: 12),
          Card(
            color: AppColors.cardBackground,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () => _showScheduleAppointmentDialog(),
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.calendar_month,
                          color: AppColors.primary, size: 24),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Schedule Next Appointment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Set up a follow-up consultation',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 24),

          // Complete Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _completeConsultation,
              icon: Icon(Icons.check_circle, size: 24),
              label:
                  Text('Complete Consultation', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.success,
                foregroundColor: AppColors.textWhite,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentlyPrescribedMedicines() {
    if (_consultationStartTime == null) return SizedBox.shrink();

    final prescribedInSession = MedicineMockData.prescribedMedicines
        .where((pm) =>
            pm.patientId == widget.patientUser.id &&
            pm.doctorId == widget.doctorUser.id &&
            pm.prescribedDate.isAfter(_consultationStartTime!))
        .toList();

    if (prescribedInSession.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Medicines Added from Store (${prescribedInSession.length})',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Clear All Medicines'),
                    content: Text(
                        'Are you sure you want to remove all medicines added from store?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            MedicineMockData.prescribedMedicines.removeWhere(
                                (pm) =>
                                    pm.patientId == widget.patientUser.id &&
                                    pm.doctorId == widget.doctorUser.id &&
                                    pm.prescribedDate
                                        .isAfter(_consultationStartTime!));
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.error,
                        ),
                        child: Text('Clear All'),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'Clear All',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        ...prescribedInSession.map((prescribed) {
          final medicine = MedicineMockData.medicines.firstWhere(
            (m) => m.id == prescribed.medicineId,
          );

          return Card(
            color: AppColors.primary.withOpacity(0.05),
            margin: EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.medication,
                        color: AppColors.primary, size: 20),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicine.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${medicine.strength} • ${prescribed.dosage}',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${prescribed.frequency} • ${prescribed.durationDays} days',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        if (prescribed.instructions.isNotEmpty) ...[
                          SizedBox(height: 4),
                          Text(
                            prescribed.instructions,
                            style: TextStyle(
                              fontSize: 11,
                              color: AppColors.textLight,
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, size: 20),
                    color: AppColors.error,
                    onPressed: () {
                      setState(() {
                        MedicineMockData.prescribedMedicines.removeWhere(
                          (pm) => pm.id == prescribed.id,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        }),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Card(
      color: AppColors.cardBackground,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary, size: 32),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showScheduleAppointmentDialog() async {
    DateTime selectedDate = DateTime.now().add(Duration(days: 7));
    TimeOfDay selectedTime = TimeOfDay(hour: 10, minute: 0);
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text('Schedule Follow-up Appointment'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 90)),
                    );
                    if (date != null) {
                      setDialogState(() {
                        selectedDate = date;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: AppColors.primary),
                        SizedBox(width: 12),
                        Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (time != null) {
                      setDialogState(() {
                        selectedTime = time;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.access_time, color: AppColors.primary),
                        SizedBox(width: 12),
                        Text(
                          selectedTime.format(context),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: reasonController,
                  decoration: InputDecoration(
                    labelText: 'Reason for follow-up',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: AppColors.primary, width: 2),
                    ),
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final appointmentDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  selectedTime.hour,
                  selectedTime.minute,
                );

                final endTime = TimeOfDay(
                  hour: selectedTime.hour,
                  minute: selectedTime.minute + 30,
                );

                final newAppointment = Appointment(
                  id: 'APT${DateTime.now().millisecondsSinceEpoch}',
                  patientId: widget.patientUser.id,
                  doctorId: widget.doctorUser.id,
                  appointmentDate: appointmentDate,
                  timeSlot:
                      '${selectedTime.format(context)} - ${endTime.format(context)}',
                  status: AppointmentStatus.scheduled,
                  reasonForVisit: reasonController.text.trim().isNotEmpty
                      ? reasonController.text.trim()
                      : 'Follow-up consultation',
                  createdAt: DateTime.now(),
                );

                MockData.appointments.add(newAppointment);

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Follow-up appointment scheduled successfully'),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: Text('Schedule'),
            ),
          ],
        ),
      ),
    );
  }
}
