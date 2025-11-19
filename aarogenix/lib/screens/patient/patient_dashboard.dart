// lib/screens/patient/patient_dashboard.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aarogenix/core/theme/app_colors.dart';
import 'package:aarogenix/screens/medicine_store_screen.dart';
import 'package:aarogenix/screens/patient/patient_medicine_tab.dart';
import 'package:aarogenix/service/appointment_service.dart';
import 'package:aarogenix/service/auth_service.dart';
import 'package:aarogenix/service/doctor_service.dart';
import 'package:aarogenix/service/patient_service.dart';

import '../../models/appointment.dart';
import '../../models/user.dart';
import 'patient_appointments_tab.dart';
import 'patient_home_tab.dart';
import 'patient_profile_tab.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  final _appointmentService = AppointmentService();
  final _doctorService = DoctorService();
  final _patientService = PatientService();
  final _authService = AuthService();

  int _selectedIndex = 0;
  List<Appointment> _appointments = [];
  bool _isLoading = true;
  bool _isInitialized = false;
  User? _user;
  dynamic _patient;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _user = ModalRoute.of(context)!.settings.arguments as User;
      _patient = _patientService.getPatientByUserId(_user!.id);
      _loadData();
      _isInitialized = true;
    }
  }

  Future<void> _loadData() async {
    final appointments =
        await _appointmentService.getAppointmentsByPatientId(_user!.id);

    setState(() {
      _appointments = appointments;
      _isLoading = false;
    });
  }

  void _handleLogout() {
    _authService.logout();
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          _getAppBarTitle(),
          style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textWhite,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _handleLogout,
          ),
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            )
          : _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textLight,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.cardBackground,
        elevation: 2,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_outlined),
            activeIcon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined),
            activeIcon: Icon(Icons.medication),
            label: 'My Medicines',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Appointments';
      case 2:
        return 'Store';
      case 3:
        return 'My Medicines';
      case 4:
        return 'Profile';
      default:
        return 'Dashboard';
    }
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return PatientHomeTab(
          user: _user!,
          patient: _patient,
          appointments: _appointments,
          appointmentService: _appointmentService,
          patientService: _patientService,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      case 1:
        return PatientAppointmentsTab(
          appointments: _appointments,
          appointmentService: _appointmentService,
          onRefresh: _loadData,
        );
      case 2:
        return MedicineStoreScreen(
          doctor: _user!,
          patient: _user,
          isPatientView: true,
        );
      case 3:
        return PatientMedicineTab(patient: _user!);
      case 4:
        return PatientProfileTab(
          user: _user!,
          patient: _patient,
          patientService: _patientService,
        );
      default:
        return PatientHomeTab(
          user: _user!,
          patient: _patient,
          appointments: _appointments,
          appointmentService: _appointmentService,
          patientService: _patientService,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
    }
  }
}
