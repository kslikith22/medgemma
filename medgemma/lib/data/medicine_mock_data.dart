// lib/data/medicine_mock_data.dart
import '../models/medicine.dart';

class MedicineMockData {
  static final List<MedicineCategory> categories = [
    MedicineCategory(
      id: 'CAT001',
      name: 'Pain Relief',
      icon: '💊',
      subcategories: [
        MedicineSubcategory(
            id: 'SUB001', name: 'Analgesics', categoryId: 'CAT001'),
        MedicineSubcategory(
            id: 'SUB002', name: 'Anti-inflammatory', categoryId: 'CAT001'),
        MedicineSubcategory(
            id: 'SUB003', name: 'Muscle Relaxants', categoryId: 'CAT001'),
      ],
    ),
    MedicineCategory(
      id: 'CAT002',
      name: 'Antibiotics',
      icon: '💉',
      subcategories: [
        MedicineSubcategory(
            id: 'SUB004', name: 'Penicillins', categoryId: 'CAT002'),
        MedicineSubcategory(
            id: 'SUB005', name: 'Cephalosporins', categoryId: 'CAT002'),
        MedicineSubcategory(
            id: 'SUB006', name: 'Macrolides', categoryId: 'CAT002'),
      ],
    ),
    MedicineCategory(
      id: 'CAT003',
      name: 'Cardiac Care',
      icon: '❤️',
      subcategories: [
        MedicineSubcategory(
            id: 'SUB007', name: 'Antihypertensives', categoryId: 'CAT003'),
        MedicineSubcategory(
            id: 'SUB008', name: 'Anticoagulants', categoryId: 'CAT003'),
        MedicineSubcategory(
            id: 'SUB009', name: 'Statins', categoryId: 'CAT003'),
      ],
    ),
    MedicineCategory(
      id: 'CAT004',
      name: 'Diabetes',
      icon: '🩸',
      subcategories: [
        MedicineSubcategory(
            id: 'SUB010', name: 'Oral Antidiabetics', categoryId: 'CAT004'),
        MedicineSubcategory(
            id: 'SUB011', name: 'Insulin', categoryId: 'CAT004'),
      ],
    ),
    MedicineCategory(
      id: 'CAT005',
      name: 'Respiratory',
      icon: '🫁',
      subcategories: [
        MedicineSubcategory(
            id: 'SUB012', name: 'Bronchodilators', categoryId: 'CAT005'),
        MedicineSubcategory(
            id: 'SUB013', name: 'Cough & Cold', categoryId: 'CAT005'),
        MedicineSubcategory(
            id: 'SUB014', name: 'Antihistamines', categoryId: 'CAT005'),
      ],
    ),
    MedicineCategory(
      id: 'CAT006',
      name: 'Vitamins & Supplements',
      icon: '🥤',
      subcategories: [
        MedicineSubcategory(
            id: 'SUB015', name: 'Multivitamins', categoryId: 'CAT006'),
        MedicineSubcategory(
            id: 'SUB016', name: 'Minerals', categoryId: 'CAT006'),
        MedicineSubcategory(
            id: 'SUB017', name: 'Protein Supplements', categoryId: 'CAT006'),
      ],
    ),
  ];

  static final List<Medicine> medicines = [
    // Pain Relief - Analgesics
    Medicine(
      id: 'MED001',
      name: 'Paracetamol',
      subcategoryId: 'SUB001',
      manufacturer: 'GSK',
      description: 'Used for pain relief and fever reduction',
      price: 25.0,
      strength: '500mg',
      packSize: '10 tablets',
      requiresPrescription: false,
      imageUrl: 'assets/medicines/paracetamol.png',
      uses: ['Headache', 'Fever', 'Body pain', 'Toothache'],
      sideEffects: ['Nausea', 'Allergic reactions (rare)'],
    ),
    Medicine(
      id: 'MED002',
      name: 'Ibuprofen',
      subcategoryId: 'SUB002',
      manufacturer: 'Abbott',
      description: 'Non-steroidal anti-inflammatory drug (NSAID)',
      price: 45.0,
      strength: '400mg',
      packSize: '10 tablets',
      requiresPrescription: false,
      imageUrl: 'assets/medicines/ibuprofen.png',
      uses: ['Pain relief', 'Inflammation', 'Fever', 'Arthritis'],
      sideEffects: ['Stomach upset', 'Dizziness', 'Heartburn'],
    ),
    Medicine(
      id: 'MED003',
      name: 'Diclofenac',
      subcategoryId: 'SUB002',
      manufacturer: 'Novartis',
      description: 'Powerful anti-inflammatory medication',
      price: 60.0,
      strength: '50mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/diclofenac.png',
      uses: ['Arthritis', 'Joint pain', 'Muscle pain', 'Dental pain'],
      sideEffects: ['Stomach pain', 'Nausea', 'Headache'],
    ),

    // Antibiotics - Penicillins
    Medicine(
      id: 'MED004',
      name: 'Amoxicillin',
      subcategoryId: 'SUB004',
      manufacturer: 'Cipla',
      description: 'Broad-spectrum antibiotic',
      price: 120.0,
      strength: '500mg',
      packSize: '10 capsules',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/amoxicillin.png',
      uses: [
        'Bacterial infections',
        'Respiratory infections',
        'Ear infections'
      ],
      sideEffects: ['Diarrhea', 'Nausea', 'Skin rash'],
    ),
    Medicine(
      id: 'MED005',
      name: 'Augmentin',
      subcategoryId: 'SUB004',
      manufacturer: 'GSK',
      description: 'Amoxicillin with Clavulanic acid',
      price: 180.0,
      strength: '625mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/augmentin.png',
      uses: [
        'Severe infections',
        'Respiratory tract infections',
        'Skin infections'
      ],
      sideEffects: ['Diarrhea', 'Nausea', 'Vomiting'],
    ),

    // Cardiac Care - Antihypertensives
    Medicine(
      id: 'MED006',
      name: 'Amlodipine',
      subcategoryId: 'SUB007',
      manufacturer: 'Pfizer',
      description: 'Calcium channel blocker for hypertension',
      price: 85.0,
      strength: '5mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/amlodipine.png',
      uses: ['High blood pressure', 'Angina', 'Coronary artery disease'],
      sideEffects: ['Swelling in ankles', 'Dizziness', 'Flushing'],
    ),
    Medicine(
      id: 'MED007',
      name: 'Atenolol',
      subcategoryId: 'SUB007',
      manufacturer: 'Sun Pharma',
      description: 'Beta-blocker for blood pressure control',
      price: 65.0,
      strength: '50mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/atenolol.png',
      uses: ['Hypertension', 'Angina', 'Heart attack prevention'],
      sideEffects: ['Fatigue', 'Cold hands', 'Slow heartbeat'],
    ),
    Medicine(
      id: 'MED008',
      name: 'Aspirin',
      subcategoryId: 'SUB008',
      manufacturer: 'Bayer',
      description: 'Antiplatelet agent',
      price: 30.0,
      strength: '75mg',
      packSize: '30 tablets',
      requiresPrescription: false,
      imageUrl: 'assets/medicines/aspirin.png',
      uses: ['Heart attack prevention', 'Stroke prevention', 'Blood thinning'],
      sideEffects: ['Stomach upset', 'Bleeding tendency'],
    ),
    Medicine(
      id: 'MED009',
      name: 'Atorvastatin',
      subcategoryId: 'SUB009',
      manufacturer: 'Pfizer',
      description: 'Statin for cholesterol management',
      price: 95.0,
      strength: '20mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/atorvastatin.png',
      uses: ['High cholesterol', 'Heart disease prevention'],
      sideEffects: ['Muscle pain', 'Liver problems', 'Digestive issues'],
    ),

    // Diabetes - Oral Antidiabetics
    Medicine(
      id: 'MED010',
      name: 'Metformin',
      subcategoryId: 'SUB010',
      manufacturer: 'Merck',
      description: 'First-line treatment for type 2 diabetes',
      price: 75.0,
      strength: '500mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/metformin.png',
      uses: ['Type 2 diabetes', 'PCOS'],
      sideEffects: ['Diarrhea', 'Nausea', 'Stomach upset'],
    ),
    Medicine(
      id: 'MED011',
      name: 'Glimepiride',
      subcategoryId: 'SUB010',
      manufacturer: 'Sanofi',
      description: 'Sulfonylurea for blood sugar control',
      price: 90.0,
      strength: '2mg',
      packSize: '10 tablets',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/glimepiride.png',
      uses: ['Type 2 diabetes'],
      sideEffects: ['Hypoglycemia', 'Weight gain', 'Nausea'],
    ),

    // Respiratory - Bronchodilators
    Medicine(
      id: 'MED012',
      name: 'Salbutamol Inhaler',
      subcategoryId: 'SUB012',
      manufacturer: 'GSK',
      description: 'Fast-acting bronchodilator',
      price: 250.0,
      strength: '100mcg',
      packSize: '200 doses',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/salbutamol.png',
      uses: ['Asthma', 'COPD', 'Breathlessness'],
      sideEffects: ['Tremors', 'Headache', 'Palpitations'],
    ),
    Medicine(
      id: 'MED013',
      name: 'Budesonide Inhaler',
      subcategoryId: 'SUB012',
      manufacturer: 'AstraZeneca',
      description: 'Corticosteroid inhaler',
      price: 450.0,
      strength: '200mcg',
      packSize: '120 doses',
      requiresPrescription: true,
      imageUrl: 'assets/medicines/budesonide.png',
      uses: ['Asthma control', 'Chronic COPD'],
      sideEffects: ['Hoarse voice', 'Oral thrush', 'Cough'],
    ),
    Medicine(
      id: 'MED014',
      name: 'Cetirizine',
      subcategoryId: 'SUB014',
      manufacturer: 'Dr. Reddy\'s',
      description: 'Antihistamine for allergies',
      price: 35.0,
      strength: '10mg',
      packSize: '10 tablets',
      requiresPrescription: false,
      imageUrl: 'assets/medicines/cetirizine.png',
      uses: ['Allergic rhinitis', 'Hay fever', 'Skin allergies', 'Urticaria'],
      sideEffects: ['Drowsiness', 'Dry mouth', 'Fatigue'],
    ),

    // Vitamins & Supplements
    Medicine(
      id: 'MED015',
      name: 'Multivitamin Tablets',
      subcategoryId: 'SUB015',
      manufacturer: 'HealthVit',
      description: 'Complete daily vitamin supplement',
      price: 120.0,
      strength: 'Standard',
      packSize: '30 tablets',
      requiresPrescription: false,
      imageUrl: 'assets/medicines/multivitamin.png',
      uses: ['Nutritional supplement', 'Immunity boost', 'General health'],
      sideEffects: ['Mild stomach upset (rare)'],
    ),
    Medicine(
      id: 'MED016',
      name: 'Calcium + Vitamin D3',
      subcategoryId: 'SUB016',
      manufacturer: 'Himalaya',
      description: 'Bone health supplement',
      price: 150.0,
      strength: '500mg + 250IU',
      packSize: '30 tablets',
      requiresPrescription: false,
      imageUrl: 'assets/medicines/calcium.png',
      uses: ['Bone health', 'Osteoporosis prevention', 'Calcium deficiency'],
      sideEffects: ['Constipation', 'Bloating'],
    ),
  ];

  static List<PrescribedMedicine> prescribedMedicines = [
    // Unordered medicine for P001
    PrescribedMedicine(
      id: 'PM001',
      medicineId: 'MED001',
      patientId: 'P001',
      doctorId: 'D001',
      dosage: '1 tablet',
      frequency: 'Twice a day',
      durationDays: 5,
      instructions: 'Take after food.',
      prescribedDate: DateTime.now().subtract(Duration(days: 1)),
      isOrdered: false,
    ),
    // Ordered medicine for P001
    PrescribedMedicine(
      id: 'PM002',
      medicineId: 'MED002',
      patientId: 'P001',
      doctorId: 'D001',
      dosage: '1 tablet',
      frequency: 'Once in evening',
      durationDays: 3,
      instructions: 'With water.',
      prescribedDate: DateTime.now().subtract(Duration(days: 3)),
      isOrdered: true,
    ),
    // Unordered medicine for P002
    PrescribedMedicine(
      id: 'PM003',
      medicineId: 'MED004',
      patientId: 'P002',
      doctorId: 'D002',
      dosage: '500mg',
      frequency: 'Twice a day',
      durationDays: 7,
      instructions: '',
      prescribedDate: DateTime.now().subtract(Duration(days: 2)),
      isOrdered: false,
    ),
    // Ordered medicine for P002
    PrescribedMedicine(
      id: 'PM004',
      medicineId: 'MED005',
      patientId: 'P002',
      doctorId: 'D002',
      dosage: '625mg',
      frequency: 'Three times a day',
      durationDays: 10,
      instructions: 'Complete the course.',
      prescribedDate: DateTime.now().subtract(Duration(days: 4)),
      isOrdered: true,
    ),
    // Unordered for P003
    PrescribedMedicine(
      id: 'PM005',
      medicineId: 'MED006',
      patientId: 'P003',
      doctorId: 'D003',
      dosage: '5mg',
      frequency: 'Once daily',
      durationDays: 15,
      instructions: 'Check BP regularly.',
      prescribedDate: DateTime.now().subtract(Duration(days: 5)),
      isOrdered: false,
    ),
  ];
}
