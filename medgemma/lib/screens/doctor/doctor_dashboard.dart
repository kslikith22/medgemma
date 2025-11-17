// lib/screens/doctor/doctor_dashboard.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medgemma/core/theme/app_colors.dart';
import 'package:medgemma/screens/medicine_store_screen.dart';
import 'package:medgemma/service/appointment_service.dart';
import 'package:medgemma/service/auth_service.dart';
import 'package:medgemma/service/doctor_service.dart';
import 'package:medgemma/service/patient_service.dart';

import '../../models/appointment.dart';
import '../../models/user.dart';
import 'doctor_appointments_tab.dart';
import 'doctor_overview_tab.dart';
import 'doctor_patients_tab.dart';
import 'doctor_profile_tab.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  final _appointmentService = AppointmentService();
  final _patientService = PatientService();
  final _doctorService = DoctorService();
  final _authService = AuthService();

  int _selectedIndex = 0;
  List<Appointment> _appointments = [];
  bool _isLoading = true;
  bool _isInitialized = false;
  User? _user;
  dynamic _doctor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _user = ModalRoute.of(context)!.settings.arguments as User;
      _doctor = _doctorService.getDoctorByUserId(_user!.id);
      _loadData();
      _isInitialized = true;
    }
  }

  Future<void> _loadData() async {
    final appointments =
        await _appointmentService.getAppointmentsByDoctorId(_user!.id);

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
            icon: Icon(Icons.dashboard_outlined),
            activeIcon: Icon(Icons.dashboard),
            label: 'Overview',
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
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Patients',
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
        return 'Medicine Store';
      case 3:
        return 'Patients';
      case 4:
        return 'Profile';
      default:
        return 'Dashboard';
    }
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return DoctorOverviewTab(
          user: _user!,
          doctor: _doctor,
          appointments: _appointments,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      case 1:
        return DoctorAppointmentsTab(
          appointments: _appointments,
          patientService: _patientService,
        );
      case 2:
        return MedicineStoreScreen(
          doctor: _user!,
          patient: null,
        );
      case 3:
        return DoctorPatientsTab(
          appointments: _appointments,
          patientService: _patientService,
        );
      case 4:
        return DoctorProfileTab(
          user: _user!,
          doctor: _doctor,
        );
      default:
        return DoctorOverviewTab(
          user: _user!,
          doctor: _doctor,
          appointments: _appointments,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
    }
  }
}
