// lib/screens/medicine_store_screen.dart

import 'package:flutter/material.dart';
import 'package:medgemma/core/theme/app_colors.dart';
import 'package:medgemma/data/medicine_mock_data.dart';
import 'package:medgemma/models/medicine.dart';
import 'package:medgemma/models/user.dart';

import 'medicine_detail_screen.dart';

class MedicineStoreScreen extends StatefulWidget {
  final User? patient;
  final User doctor;
  final bool isPatientView;
  final bool fromConsulation;

  const MedicineStoreScreen({
    super.key,
    this.patient,
    required this.doctor,
    this.isPatientView = false,
    this.fromConsulation = false,
  });

  @override
  State<MedicineStoreScreen> createState() => _MedicineStoreScreenState();
}

class _MedicineStoreScreenState extends State<MedicineStoreScreen> {
  MedicineCategory? _selectedCategory;
  MedicineSubcategory? _selectedSubcategory;
  List<Medicine> _filteredMedicines = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (MedicineMockData.categories.isNotEmpty) {
      _selectedCategory = MedicineMockData.categories.first;
      if (_selectedCategory!.subcategories.isNotEmpty) {
        _selectedSubcategory = _selectedCategory!.subcategories.first;
        _filterMedicines();
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterMedicines() {
    setState(() {
      _filteredMedicines = MedicineMockData.medicines
          .where((med) => med.subcategoryId == _selectedSubcategory?.id)
          .toList();
    });
  }

  void _searchMedicines(String query) {
    setState(() {
      if (query.isEmpty) {
        _filterMedicines();
      } else {
        _filteredMedicines = MedicineMockData.medicines
            .where((med) =>
                med.name.toLowerCase().contains(query.toLowerCase()) ||
                med.manufacturer.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: widget.fromConsulation
          ? AppBar(
              title: Text(
                  widget.isPatientView ? 'Shop Medicine' : 'Medicine Store'),
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textWhite,
              elevation: 0,
            )
          : null,
      body: Column(
        children: [
          // Search Bar
          Container(
            color: AppColors.cardBackground,
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              onChanged: _searchMedicines,
              decoration: InputDecoration(
                hintText: 'Search medicines...',
                prefixIcon: Icon(Icons.search, color: AppColors.primary),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          _searchMedicines('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.background,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Category Chips
          Container(
            height: 70,
            color: AppColors.cardBackground,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: MedicineMockData.categories.length,
              itemBuilder: (context, index) {
                final category = MedicineMockData.categories[index];
                final isSelected = category.id == _selectedCategory?.id;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                      if (category.subcategories.isNotEmpty) {
                        _selectedSubcategory = category.subcategories.first;
                        _filterMedicines();
                      }
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : AppColors.background,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:
                            isSelected ? AppColors.primary : AppColors.border,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(category.icon, style: TextStyle(fontSize: 18)),
                        SizedBox(width: 6),
                        Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Divider(height: 1, color: AppColors.divider),

          // Main Content
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 100,
                  color: AppColors.background,
                  child: _selectedCategory == null ||
                          _selectedCategory!.subcategories.isEmpty
                      ? SizedBox()
                      : ListView.builder(
                          itemCount: _selectedCategory!.subcategories.length,
                          itemBuilder: (context, index) {
                            final subcategory =
                                _selectedCategory!.subcategories[index];
                            final isSelected =
                                subcategory.id == _selectedSubcategory?.id;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedSubcategory = subcategory;
                                  _filterMedicines();
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primary.withOpacity(0.1)
                                      : Colors.transparent,
                                  border: Border(
                                    left: BorderSide(
                                      color: isSelected
                                          ? AppColors.primary
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  subcategory.name,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? AppColors.primary
                                        : AppColors.textSecondary,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            );
                          },
                        ),
                ),

                // Products Grid
                Expanded(
                  child: _filteredMedicines.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.medical_services_outlined,
                                  size: 60, color: AppColors.textLight),
                              SizedBox(height: 16),
                              Text('No medicines found',
                                  style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 15)),
                            ],
                          ),
                        )
                      : GridView.builder(
                          padding: EdgeInsets.all(10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.55,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 14,
                          ),
                          itemCount: _filteredMedicines.length,
                          itemBuilder: (context, index) =>
                              _buildMedicineCard(_filteredMedicines[index]),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(Medicine medicine) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MedicineDetailScreen(
              medicine: medicine,
              patient: widget.isPatientView ? widget.patient : null,
              doctor: widget.doctor,
              isPatientView: widget.isPatientView,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image with Add Button Overlay
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.08),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.medication_rounded,
                          size: 48, color: AppColors.primary),
                    ),
                  ),
                  Positioned(
                    right: 6,
                    top: 6,
                    child: GestureDetector(
                      onTap: () {
                        // Add to cart
                      },
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Details Section
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          medicine.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          medicine.strength,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          medicine.packSize,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.textLight,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹${medicine.price.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        if (medicine.requiresPrescription)
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.warning.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Rx',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.warning,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
