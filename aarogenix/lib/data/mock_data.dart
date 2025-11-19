// lib/data/mock_data.dart
import 'package:aarogenix/models/user_type.dart';

import '../models/appointment.dart';
import '../models/doctor.dart';
import '../models/medical_record.dart';
import '../models/patient.dart';
import '../models/user.dart';

class MockData {
  // Mock Users
  static final List<User> users = [
    // Doctors
    User(
      id: 'D001',
      email: 'dr.sharma@hospital.com',
      password: 'doctor123',
      userType: UserType.doctor,
      fullName: 'Dr. Rajesh Sharma',
      phone: '+91 98765 43210',
      profileImage: 'https://example.com/doctor1.jpg',
    ),
    User(
      id: 'D002',
      email: 'dr.patel@hospital.com',
      password: 'doctor123',
      userType: UserType.doctor,
      fullName: 'Dr. Priya Patel',
      phone: '+91 98765 43211',
      profileImage: 'https://example.com/doctor2.jpg',
    ),
    User(
      id: 'D003',
      email: 'dr.kumar@hospital.com',
      password: 'doctor123',
      userType: UserType.doctor,
      fullName: 'Dr. Anil Kumar',
      phone: '+91 98765 43212',
      profileImage: 'https://example.com/doctor3.jpg',
    ),

    // Patients
    User(
      id: 'P001',
      email: 'patient1@email.com',
      password: 'patient123',
      userType: UserType.patient,
      fullName: 'Amit Singh',
      phone: '+91 98765 54321',
      profileImage: 'https://example.com/patient1.jpg',
    ),
    User(
      id: 'P002',
      email: 'patient2@email.com',
      password: 'patient123',
      userType: UserType.patient,
      fullName: 'Sneha Reddy',
      phone: '+91 98765 54322',
      profileImage: 'https://example.com/patient2.jpg',
    ),
    User(
      id: 'P003',
      email: 'patient3@email.com',
      password: 'patient123',
      userType: UserType.patient,
      fullName: 'Vikram Mehta',
      phone: '+91 98765 54323',
      profileImage: 'https://example.com/patient3.jpg',
    ),
    User(
      id: 'P004',
      email: 'patient4@email.com',
      password: 'patient123',
      userType: UserType.patient,
      fullName: 'Ananya Desai',
      phone: '+91 98765 54324',
      profileImage: 'https://example.com/patient4.jpg',
    ),
    User(
      id: 'P005',
      email: 'patient5@email.com',
      password: 'patient123',
      userType: UserType.patient,
      fullName: 'Rohit Kapoor',
      phone: '+91 98765 54325',
      profileImage: 'https://example.com/patient5.jpg',
    ),
  ];

  // Mock Doctors
  static final List<Doctor> doctors = [
    Doctor(
      id: 'DOC001',
      userId: 'D001',
      specialization: 'Cardiologist',
      qualification: 'MBBS, MD (Cardiology)',
      experienceYears: 15,
      hospitalName: 'Apollo Hospital',
      consultationFee: 800.0,
      rating: 4.8,
      totalReviews: 250,
      availableDays: ['Monday', 'Tuesday', 'Wednesday', 'Friday'],
      startTime: '09:00 AM',
      endTime: '05:00 PM',
    ),
    Doctor(
      id: 'DOC002',
      userId: 'D002',
      specialization: 'Pediatrician',
      qualification: 'MBBS, MD (Pediatrics)',
      experienceYears: 10,
      hospitalName: 'Fortis Hospital',
      consultationFee: 600.0,
      rating: 4.9,
      totalReviews: 320,
      availableDays: ['Monday', 'Wednesday', 'Thursday', 'Saturday'],
      startTime: '10:00 AM',
      endTime: '06:00 PM',
    ),
    Doctor(
      id: 'DOC003',
      userId: 'D003',
      specialization: 'Orthopedic Surgeon',
      qualification: 'MBBS, MS (Orthopedics)',
      experienceYears: 12,
      hospitalName: 'Max Hospital',
      consultationFee: 1000.0,
      rating: 4.7,
      totalReviews: 180,
      availableDays: ['Tuesday', 'Thursday', 'Friday', 'Saturday'],
      startTime: '08:00 AM',
      endTime: '04:00 PM',
    ),
  ];

  // Mock Patients
  static final List<Patient> patients = [
    Patient(
      id: 'PAT001',
      userId: 'P001',
      dateOfBirth: DateTime(1985, 5, 15),
      bloodGroup: 'O+',
      height: 175.0,
      weight: 75.0,
      allergies: ['Penicillin', 'Pollen'],
      chronicConditions: ['Hypertension'],
      emergencyContact: '+91 98765 11111',
    ),
    Patient(
      id: 'PAT002',
      userId: 'P002',
      dateOfBirth: DateTime(1990, 8, 22),
      bloodGroup: 'A+',
      height: 165.0,
      weight: 60.0,
      allergies: ['Dust'],
      chronicConditions: [],
      emergencyContact: '+91 98765 22222',
    ),
    Patient(
      id: 'PAT003',
      userId: 'P003',
      dateOfBirth: DateTime(1978, 12, 10),
      bloodGroup: 'B+',
      height: 180.0,
      weight: 85.0,
      allergies: [],
      chronicConditions: ['Diabetes Type 2'],
      emergencyContact: '+91 98765 33333',
    ),
    Patient(
      id: 'PAT004',
      userId: 'P004',
      dateOfBirth: DateTime(1995, 3, 18),
      bloodGroup: 'AB+',
      height: 162.0,
      weight: 58.0,
      allergies: ['Sulfa drugs', 'Shellfish'],
      chronicConditions: ['Asthma'],
      emergencyContact: '+91 98765 44444',
    ),
    Patient(
      id: 'PAT005',
      userId: 'P005',
      dateOfBirth: DateTime(1982, 7, 25),
      bloodGroup: 'O-',
      height: 178.0,
      weight: 82.0,
      allergies: ['Latex'],
      chronicConditions: ['Migraine', 'High Cholesterol'],
      emergencyContact: '+91 98765 55555',
    ),
  ];

  // Mock Appointments with various combinations
  static final List<Appointment> appointments = [
    // TODAY'S APPOINTMENTS - Morning slots
    Appointment(
      id: 'APT001',
      patientId: 'P001',
      doctorId: 'D001',
      appointmentDate: DateTime.now(),
      timeSlot: '09:00 AM - 09:30 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Regular cardiac checkup',
      notes: 'Please bring previous ECG reports',
      createdAt: DateTime.now().subtract(Duration(days: 3)),
    ),
    Appointment(
      id: 'APT002',
      patientId: 'P004',
      doctorId: 'D001',
      appointmentDate: DateTime.now(),
      timeSlot: '10:00 AM - 10:30 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Chest pain consultation',
      notes: 'First-time visit',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
    ),

    // TODAY'S APPOINTMENTS - Afternoon slots
    Appointment(
      id: 'APT003',
      patientId: 'P002',
      doctorId: 'D002',
      appointmentDate: DateTime.now(),
      timeSlot: '02:00 PM - 02:30 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Child vaccination - MMR',
      notes: 'Bring vaccination card',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
    ),
    Appointment(
      id: 'APT004',
      patientId: 'P005',
      doctorId: 'D003',
      appointmentDate: DateTime.now(),
      timeSlot: '03:00 PM - 03:30 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Follow-up on knee surgery',
      notes: 'Post-surgery checkup',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),

    // TODAY'S APPOINTMENTS - Evening slots
    Appointment(
      id: 'APT005',
      patientId: 'P003',
      doctorId: 'D001',
      appointmentDate: DateTime.now(),
      timeSlot: '04:30 PM - 05:00 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Blood pressure monitoring',
      notes: 'Medication review needed',
      createdAt: DateTime.now().subtract(Duration(days: 4)),
    ),

    // UPCOMING APPOINTMENTS - Tomorrow
    Appointment(
      id: 'APT006',
      patientId: 'P001',
      doctorId: 'D002',
      appointmentDate: DateTime.now().add(Duration(days: 1)),
      timeSlot: '10:00 AM - 10:30 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Annual health checkup',
      notes: 'Fasting required',
      createdAt: DateTime.now().subtract(Duration(days: 6)),
    ),
    Appointment(
      id: 'APT007',
      patientId: 'P004',
      doctorId: 'D002',
      appointmentDate: DateTime.now().add(Duration(days: 1)),
      timeSlot: '11:30 AM - 12:00 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Asthma review',
      notes: 'Please bring inhaler',
      createdAt: DateTime.now().subtract(Duration(days: 3)),
    ),

    // UPCOMING APPOINTMENTS - 2 days from now
    Appointment(
      id: 'APT008',
      patientId: 'P002',
      doctorId: 'D001',
      appointmentDate: DateTime.now().add(Duration(days: 2)),
      timeSlot: '09:30 AM - 10:00 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Heart palpitations concern',
      notes: 'ECG scheduled',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
    ),
    Appointment(
      id: 'APT009',
      patientId: 'P005',
      doctorId: 'D002',
      appointmentDate: DateTime.now().add(Duration(days: 2)),
      timeSlot: '03:00 PM - 03:30 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Migraine consultation',
      notes: 'Headache diary attached',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
    ),

    // UPCOMING APPOINTMENTS - 3 days from now
    Appointment(
      id: 'APT010',
      patientId: 'P003',
      doctorId: 'D003',
      appointmentDate: DateTime.now().add(Duration(days: 3)),
      timeSlot: '08:30 AM - 09:00 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Lower back pain',
      notes: 'X-ray required',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
    ),
    Appointment(
      id: 'APT011',
      patientId: 'P004',
      doctorId: 'D003',
      appointmentDate: DateTime.now().add(Duration(days: 3)),
      timeSlot: '10:00 AM - 10:30 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Ankle sprain follow-up',
      createdAt: DateTime.now().subtract(Duration(days: 4)),
    ),

    // UPCOMING APPOINTMENTS - Next week
    Appointment(
      id: 'APT012',
      patientId: 'P001',
      doctorId: 'D003',
      appointmentDate: DateTime.now().add(Duration(days: 5)),
      timeSlot: '02:00 PM - 02:30 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Shoulder pain assessment',
      notes: 'MRI report available',
      createdAt: DateTime.now().subtract(Duration(days: 7)),
    ),
    Appointment(
      id: 'APT013',
      patientId: 'P002',
      doctorId: 'D003',
      appointmentDate: DateTime.now().add(Duration(days: 7)),
      timeSlot: '11:00 AM - 11:30 AM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Sports injury consultation',
      createdAt: DateTime.now().subtract(Duration(days: 3)),
    ),
    Appointment(
      id: 'APT014',
      patientId: 'P005',
      doctorId: 'D001',
      appointmentDate: DateTime.now().add(Duration(days: 10)),
      timeSlot: '01:00 PM - 01:30 PM',
      status: AppointmentStatus.scheduled,
      reasonForVisit: 'Cholesterol level review',
      notes: 'Blood test done',
      createdAt: DateTime.now().subtract(Duration(days: 8)),
    ),

    // COMPLETED APPOINTMENTS - Last week
    Appointment(
      id: 'APT015',
      patientId: 'P001',
      doctorId: 'D001',
      appointmentDate: DateTime.now().subtract(Duration(days: 7)),
      timeSlot: '11:00 AM - 11:30 AM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Blood pressure checkup',
      notes: 'Medication adjusted',
      createdAt: DateTime.now().subtract(Duration(days: 14)),
    ),
    Appointment(
      id: 'APT016',
      patientId: 'P003',
      doctorId: 'D003',
      appointmentDate: DateTime.now().subtract(Duration(days: 7)),
      timeSlot: '09:00 AM - 09:30 AM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Knee pain evaluation',
      notes: 'Physical therapy recommended',
      createdAt: DateTime.now().subtract(Duration(days: 10)),
    ),
    Appointment(
      id: 'APT017',
      patientId: 'P004',
      doctorId: 'D002',
      appointmentDate: DateTime.now().subtract(Duration(days: 5)),
      timeSlot: '10:30 AM - 11:00 AM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Breathing difficulty',
      notes: 'Inhaler dosage increased',
      createdAt: DateTime.now().subtract(Duration(days: 12)),
    ),

    // COMPLETED APPOINTMENTS - 2 weeks ago
    Appointment(
      id: 'APT018',
      patientId: 'P002',
      doctorId: 'D002',
      appointmentDate: DateTime.now().subtract(Duration(days: 14)),
      timeSlot: '02:00 PM - 02:30 PM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Routine pediatric checkup',
      notes: 'All vitals normal',
      createdAt: DateTime.now().subtract(Duration(days: 21)),
    ),
    Appointment(
      id: 'APT019',
      patientId: 'P005',
      doctorId: 'D003',
      appointmentDate: DateTime.now().subtract(Duration(days: 14)),
      timeSlot: '08:00 AM - 08:30 AM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Pre-surgery consultation',
      notes: 'Surgery scheduled',
      createdAt: DateTime.now().subtract(Duration(days: 20)),
    ),
    Appointment(
      id: 'APT020',
      patientId: 'P001',
      doctorId: 'D002',
      appointmentDate: DateTime.now().subtract(Duration(days: 15)),
      timeSlot: '03:00 PM - 03:30 PM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Fever and cold',
      notes: 'Antibiotics prescribed',
      createdAt: DateTime.now().subtract(Duration(days: 18)),
    ),

    // COMPLETED APPOINTMENTS - Last month
    Appointment(
      id: 'APT021',
      patientId: 'P003',
      doctorId: 'D001',
      appointmentDate: DateTime.now().subtract(Duration(days: 30)),
      timeSlot: '10:00 AM - 10:30 AM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Diabetes consultation',
      notes: 'HbA1c test ordered',
      createdAt: DateTime.now().subtract(Duration(days: 37)),
    ),
    Appointment(
      id: 'APT022',
      patientId: 'P004',
      doctorId: 'D001',
      appointmentDate: DateTime.now().subtract(Duration(days: 28)),
      timeSlot: '11:30 AM - 12:00 PM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Heart health screening',
      notes: 'All tests normal',
      createdAt: DateTime.now().subtract(Duration(days: 35)),
    ),
    Appointment(
      id: 'APT023',
      patientId: 'P005',
      doctorId: 'D002',
      appointmentDate: DateTime.now().subtract(Duration(days: 25)),
      timeSlot: '04:00 PM - 04:30 PM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Headache treatment',
      notes: 'Preventive medication started',
      createdAt: DateTime.now().subtract(Duration(days: 32)),
    ),
    Appointment(
      id: 'APT024',
      patientId: 'P002',
      doctorId: 'D003',
      appointmentDate: DateTime.now().subtract(Duration(days: 20)),
      timeSlot: '01:00 PM - 01:30 PM',
      status: AppointmentStatus.completed,
      reasonForVisit: 'Wrist fracture follow-up',
      notes: 'Cast removed',
      createdAt: DateTime.now().subtract(Duration(days: 27)),
    ),

    // CANCELLED APPOINTMENTS
    Appointment(
      id: 'APT025',
      patientId: 'P003',
      doctorId: 'D002',
      appointmentDate: DateTime.now().subtract(Duration(days: 2)),
      timeSlot: '09:00 AM - 09:30 AM',
      status: AppointmentStatus.cancelled,
      reasonForVisit: 'General consultation',
      notes: 'Patient cancelled due to emergency',
      createdAt: DateTime.now().subtract(Duration(days: 9)),
    ),
    Appointment(
      id: 'APT026',
      patientId: 'P004',
      doctorId: 'D003',
      appointmentDate: DateTime.now().add(Duration(days: 4)),
      timeSlot: '03:30 PM - 04:00 PM',
      status: AppointmentStatus.cancelled,
      reasonForVisit: 'Joint pain',
      notes: 'Rescheduling requested',
      createdAt: DateTime.now().subtract(Duration(days: 6)),
    ),
  ];

  // Mock Medical Records - Enhanced with new patients
  static final List<MedicalRecord> medicalRecords = [
    // Patient 1 (Amit Singh) records
    MedicalRecord(
      id: 'MR001',
      patientId: 'P001',
      doctorId: 'D001',
      visitDate: DateTime.now().subtract(Duration(days: 30)),
      diagnosis: 'Mild hypertension',
      prescriptions: [
        'Amlodipine 5mg - Once daily',
        'Aspirin 75mg - Once daily'
      ],
      labResults: 'BP: 140/90, Cholesterol: Normal, Blood Sugar: 95 mg/dL',
      notes:
          'Advised lifestyle changes: reduce salt intake, regular exercise 30 mins daily, weight management',
    ),
    MedicalRecord(
      id: 'MR002',
      patientId: 'P001',
      doctorId: 'D001',
      visitDate: DateTime.now().subtract(Duration(days: 7)),
      diagnosis: 'Hypertension - Improving',
      prescriptions: [
        'Amlodipine 5mg - Once daily',
        'Aspirin 75mg - Once daily'
      ],
      labResults: 'BP: 130/85, Weight: 73kg',
      notes:
          'Blood pressure improving. Continue current medication. Follow-up in 1 month',
    ),
    MedicalRecord(
      id: 'MR003',
      patientId: 'P001',
      doctorId: 'D002',
      visitDate: DateTime.now().subtract(Duration(days: 15)),
      diagnosis: 'Upper respiratory tract infection',
      prescriptions: [
        'Amoxicillin 500mg - Thrice daily for 7 days',
        'Paracetamol 500mg - SOS for fever'
      ],
      labResults: 'Temperature: 99.5°F, Throat examination: Mild inflammation',
      notes: 'Rest advised. Drink plenty of fluids. Avoid cold beverages',
    ),

    // Patient 2 (Sneha Reddy) records
    MedicalRecord(
      id: 'MR004',
      patientId: 'P002',
      doctorId: 'D002',
      visitDate: DateTime.now().subtract(Duration(days: 14)),
      diagnosis: 'Pediatric routine checkup - Child healthy',
      prescriptions: ['Multivitamin syrup - Once daily'],
      labResults: 'Height: 110cm, Weight: 18kg, All vitals normal',
      notes: 'Child development on track. Next vaccination due in 2 months',
    ),
    MedicalRecord(
      id: 'MR005',
      patientId: 'P002',
      doctorId: 'D003',
      visitDate: DateTime.now().subtract(Duration(days: 20)),
      diagnosis: 'Wrist fracture (Colles fracture)',
      prescriptions: [
        'Calcium supplements - Twice daily',
        'Ibuprofen 400mg - Twice daily for pain'
      ],
      labResults: 'X-ray: Distal radius fracture confirmed',
      notes:
          'Cast applied for 6 weeks. No weight bearing on affected hand. Follow-up in 3 weeks',
    ),

    // Patient 3 (Vikram Mehta) records
    MedicalRecord(
      id: 'MR006',
      patientId: 'P003',
      doctorId: 'D003',
      visitDate: DateTime.now().subtract(Duration(days: 7)),
      diagnosis: 'Osteoarthritis - Right Knee',
      prescriptions: [
        'Ibuprofen 400mg - Twice daily',
        'Glucosamine supplement - Once daily'
      ],
      labResults: 'X-ray: Mild joint degeneration, Cartilage thinning observed',
      notes:
          'Physical therapy recommended. Hot/cold compress. Avoid stairs. Weight reduction advised',
    ),
    MedicalRecord(
      id: 'MR007',
      patientId: 'P003',
      doctorId: 'D001',
      visitDate: DateTime.now().subtract(Duration(days: 30)),
      diagnosis: 'Type 2 Diabetes Mellitus - Controlled',
      prescriptions: [
        'Metformin 500mg - Twice daily',
        'Glimepiride 2mg - Once daily before breakfast'
      ],
      labResults: 'HbA1c: 6.8%, Fasting Blood Sugar: 118 mg/dL, PP: 145 mg/dL',
      notes:
          'Blood sugar levels controlled. Continue current medication. Diet compliance good. Exercise regularly',
    ),

    // Patient 4 (Ananya Desai) records
    MedicalRecord(
      id: 'MR008',
      patientId: 'P004',
      doctorId: 'D002',
      visitDate: DateTime.now().subtract(Duration(days: 5)),
      diagnosis: 'Acute asthma exacerbation',
      prescriptions: [
        'Salbutamol inhaler - 2 puffs every 4-6 hours',
        'Budesonide inhaler - 2 puffs twice daily',
        'Prednisolone 20mg - Once daily for 5 days'
      ],
      labResults: 'Peak flow: 280 L/min (60% of predicted), SpO2: 94%',
      notes:
          'Triggered by dust exposure. Avoid allergens. Use spacer with inhaler. Emergency plan reviewed',
    ),
    MedicalRecord(
      id: 'MR009',
      patientId: 'P004',
      doctorId: 'D001',
      visitDate: DateTime.now().subtract(Duration(days: 28)),
      diagnosis: 'Routine cardiac screening - Normal',
      prescriptions: [],
      labResults: 'ECG: Normal sinus rhythm, BP: 118/76, Heart rate: 72 bpm',
      notes:
          'No cardiac abnormalities detected. Maintain healthy lifestyle. Annual checkup recommended',
    ),
    MedicalRecord(
      id: 'MR010',
      patientId: 'P004',
      doctorId: 'D003',
      visitDate: DateTime.now().subtract(Duration(days: 45)),
      diagnosis: 'Ankle sprain - Grade II',
      prescriptions: [
        'Ibuprofen 600mg - Thrice daily',
        'Ice therapy guidance provided'
      ],
      labResults: 'X-ray: No fracture detected, Ligament strain confirmed',
      notes:
          'RICE protocol advised. Ankle support bandage. No sports for 4 weeks. Physiotherapy referred',
    ),

    // Patient 5 (Rohit Kapoor) records
    MedicalRecord(
      id: 'MR011',
      patientId: 'P005',
      doctorId: 'D003',
      visitDate: DateTime.now().subtract(Duration(days: 14)),
      diagnosis: 'Post-operative knee arthroscopy - Recovering well',
      prescriptions: [
        'Tramadol 50mg - Twice daily for pain',
        'Cefixime 200mg - Twice daily for 7 days',
        'Calcium with Vitamin D - Once daily'
      ],
      labResults:
          'Wound healing well, No signs of infection, Range of motion: 80 degrees',
      notes:
          'Surgery successful. Continue physiotherapy. Ice compress 3 times daily. Follow-up in 2 weeks',
    ),
    MedicalRecord(
      id: 'MR012',
      patientId: 'P005',
      doctorId: 'D002',
      visitDate: DateTime.now().subtract(Duration(days: 25)),
      diagnosis: 'Chronic Migraine',
      prescriptions: [
        'Sumatriptan 50mg - For acute attacks',
        'Propranolol 40mg - Twice daily (preventive)',
        'Amitriptyline 10mg - At bedtime'
      ],
      labResults: 'Blood pressure: 128/82, Neurological exam: Normal',
      notes:
          'Migraine frequency: 12 days/month. Preventive therapy started. Avoid triggers: stress, lack of sleep, certain foods. Maintain headache diary',
    ),
    MedicalRecord(
      id: 'MR013',
      patientId: 'P005',
      doctorId: 'D001',
      visitDate: DateTime.now().subtract(Duration(days: 60)),
      diagnosis: 'Hyperlipidemia (High Cholesterol)',
      prescriptions: [
        'Atorvastatin 20mg - Once daily at bedtime',
        'Omega-3 supplements - Once daily'
      ],
      labResults:
          'Total Cholesterol: 245 mg/dL, LDL: 165 mg/dL, HDL: 38 mg/dL, Triglycerides: 210 mg/dL',
      notes:
          'Lifestyle modification crucial. Low-fat diet. Regular aerobic exercise 45 mins, 5 days/week. Recheck lipid profile in 3 months',
    ),
  ];
}
