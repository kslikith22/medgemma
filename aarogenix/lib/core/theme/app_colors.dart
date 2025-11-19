// lib/constants/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF0080FF);
  static const Color primaryLight = Color(0xFF3399FF);
  static const Color primaryDark = Color(0xFF0066CC);
  
  // Background Colors
  static const Color background = Color(0xFFF9FAFB);
  static const Color cardBackground = Colors.white;
  static const Color darkBackground = Color(0xFF304050);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF304050);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);
  static const Color textWhite = Colors.white;
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF0080FF),
    Color(0xFF0066CC),
  ];
  
  static const List<Color> darkGradient = [
    Color(0xFF1F2937),
    Color(0xFF304050),
  ];
  
  // Chart Colors
  static const Color chartBlue = Color(0xFF0080FF);
  static const Color chartGreen = Color(0xFF10B981);
  static const Color chartOrange = Color(0xFFF59E0B);
  static const Color chartPurple = Color(0xFF8B5CF6);
  static const Color chartRed = Color(0xFFEF4444);
  
  // Additional Colors
  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFD1D5DB);
  static const Color disabled = Color(0xFF9CA3AF);
  
  // Shadow
  static const Color shadow = Color(0x1A000000);
  
  // Appointment Status Colors
  static const Color scheduled = Color(0xFF0080FF);
  static const Color completed = Color(0xFF10B981);
  static const Color cancelled = Color(0xFFEF4444);
  static const Color rescheduled = Color(0xFFF59E0B);
}
