// lib/main.dart
import 'package:flutter/material.dart';
import 'package:medgemma/core/theme/app_colors.dart';
import 'package:medgemma/screens/ecg_analysis_screen.dart';

import 'screens/doctor/doctor_dashboard.dart';
import 'screens/login_screen.dart';
import 'screens/patient/patient_dashboard.dart';

void main() {
  runApp(const HospitalManagementApp());
}

class HospitalManagementApp extends StatelessWidget {
  const HospitalManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Management',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        cardTheme: CardTheme(
          color: AppColors.cardBackground,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textWhite,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/doctor-dashboard': (context) => DoctorDashboard(),
        '/patient-dashboard': (context) => PatientDashboard(),
        '/ecg-upload-analysis': (context) => EcgUploadAndAnalysisScreen(),
      },
    );
  }
}
