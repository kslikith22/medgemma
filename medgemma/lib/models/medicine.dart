// lib/models/medicine.dart
class MedicineCategory {
  final String id;
  final String name;
  final String icon;
  final List<MedicineSubcategory> subcategories;

  MedicineCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.subcategories,
  });
}

class MedicineSubcategory {
  final String id;
  final String name;
  final String categoryId;

  MedicineSubcategory({
    required this.id,
    required this.name,
    required this.categoryId,
  });
}

class Medicine {
  final String id;
  final String name;
  final String subcategoryId;
  final String manufacturer;
  final String description;
  final double price;
  final String strength;
  final String packSize;
  final bool requiresPrescription;
  final String imageUrl;
  final List<String> uses;
  final List<String> sideEffects;

  Medicine({
    required this.id,
    required this.name,
    required this.subcategoryId,
    required this.manufacturer,
    required this.description,
    required this.price,
    required this.strength,
    required this.packSize,
    required this.requiresPrescription,
    required this.imageUrl,
    required this.uses,
    required this.sideEffects,
  });
}

class PrescribedMedicine {
  final String id;
  final String medicineId;
  final String patientId;
  final String doctorId;
  final String dosage;
  final String frequency;
  final int durationDays;
  final String instructions;
  final DateTime prescribedDate;
  final bool isOrdered;

  PrescribedMedicine({
    required this.id,
    required this.medicineId,
    required this.patientId,
    required this.doctorId,
    required this.dosage,
    required this.frequency,
    required this.durationDays,
    required this.instructions,
    required this.prescribedDate,
    this.isOrdered = false,
  });
}
