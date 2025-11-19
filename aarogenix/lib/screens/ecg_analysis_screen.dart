import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class EcgAnalysis {
  final String fileName;
  final DateTime uploadDate;
  final String status;
  final String resultSummary;
  final int heartRate;
  final List<String> arrhythmias;
  final String pWaveObservation;
  final String qrsComplexObservation;
  final String tWaveObservation;
  final String recommendations;
  final String detailedReport;

  EcgAnalysis({
    required this.fileName,
    required this.uploadDate,
    required this.status,
    required this.resultSummary,
    this.heartRate = 0,
    this.arrhythmias = const [],
    this.pWaveObservation = '',
    this.qrsComplexObservation = '',
    this.tWaveObservation = '',
    this.recommendations = '',
    this.detailedReport = '',
  });
}

class EcgUploadAndAnalysisScreen extends StatefulWidget {
  const EcgUploadAndAnalysisScreen({super.key});

  @override
  _EcgUploadAndAnalysisScreenState createState() =>
      _EcgUploadAndAnalysisScreenState();
}

class _EcgUploadAndAnalysisScreenState
    extends State<EcgUploadAndAnalysisScreen> {
  final List<EcgAnalysis> _analyses = [
    EcgAnalysis(
      fileName: 'ECG_Report_2023_08_01.pdf',
      uploadDate: DateTime(2023, 8, 1, 10, 30),
      status: 'Completed',
      resultSummary: 'Normal Sinus Rhythm',
      heartRate: 72,
      arrhythmias: [],
      pWaveObservation: 'Normal morphology',
      qrsComplexObservation: 'Normal conduction',
      tWaveObservation: 'Symmetric and upright',
      recommendations: 'Maintain healthy lifestyle.',
      detailedReport:
          'The ECG shows normal sinus rhythm with no abnormalities detected.',
    ),
    EcgAnalysis(
      fileName: 'ECG_2023_07_15.csv',
      uploadDate: DateTime(2023, 7, 15, 14, 15),
      status: 'Completed',
      resultSummary: 'Minor Premature Ventricular Contractions',
      heartRate: 68,
      arrhythmias: ['PVCs'],
      pWaveObservation: 'Slight disturbances',
      qrsComplexObservation: 'Slight prolongation',
      tWaveObservation: 'Inverted in V1–V3',
      recommendations: 'Follow-up recommended.',
      detailedReport: 'ECG indicates PVCs but no urgent abnormalities.',
    ),
    EcgAnalysis(
      fileName: 'ecg_sample.txt',
      uploadDate: DateTime(2023, 6, 4, 9, 45),
      status: 'Pending',
      resultSummary: 'Analysis in progress',
    ),
  ];

  bool _isUploading = false;
  String? _selectedFileName;

  Future<void> _pickAndAnalyzeFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'csv', 'txt', 'ecg'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFileName = result.files.single.name;
        _isUploading = true;
      });

      await Future.delayed(const Duration(seconds: 3));

      setState(() {
        _isUploading = false;
        _analyses.insert(
          0,
          EcgAnalysis(
            fileName: _selectedFileName!,
            uploadDate: DateTime.now(),
            status: 'Completed',
            resultSummary: 'Normal Sinus Rhythm',
            heartRate: 70,
            arrhythmias: [],
            pWaveObservation: 'Normal',
            qrsComplexObservation: 'Normal duration',
            tWaveObservation: 'Normal',
            recommendations: 'No action needed.',
            detailedReport:
                'AI analysis indicates normal sinus rhythm with healthy signals.',
          ),
        );
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('ECG analysis completed.'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('ECG AI Analysis'),
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUploadCard(),
            const SizedBox(height: 28),
            _buildRecentHeader(),
            const SizedBox(height: 16),
            _buildAnalysisList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: const Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(Icons.monitor_heart_rounded,
                    color: AppColors.primary, size: 34),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Upload ECG for AI-powered cardiac analysis',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          ElevatedButton.icon(
            onPressed: _isUploading ? null : _pickAndAnalyzeFile,
            icon: Icon(
              _isUploading
                  ? Icons.hourglass_bottom
                  : Icons.file_upload_outlined,
              size: 20,
              color: Colors.white,
            ),
            label: Text(_isUploading ? 'Analyzing...' : 'Select ECG File'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          if (_selectedFileName != null && !_isUploading) ...[
            const SizedBox(height: 12),
            Text(
              'Selected: $_selectedFileName',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ]
        ],
      ),
    );
  }

  Widget _buildRecentHeader() {
    return Text(
      'Recent ECG Analyses',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildAnalysisList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _analyses.length,
      itemBuilder: (_, i) => EcgAnalysisItem(analysis: _analyses[i]),
    );
  }
}

// ------------------------ ITEM CARD ------------------------

class EcgAnalysisItem extends StatefulWidget {
  final EcgAnalysis analysis;

  const EcgAnalysisItem({super.key, required this.analysis});

  @override
  State<EcgAnalysisItem> createState() => _EcgAnalysisItemState();
}

class _EcgAnalysisItemState extends State<EcgAnalysisItem> {
  bool _expanded = false;

  Widget _statusChip(String status) {
    Color bg, fg;

    if (status == 'Completed') {
      bg = AppColors.success.withOpacity(0.12);
      fg = AppColors.success;
    } else {
      bg = AppColors.warning.withOpacity(0.12);
      fg = AppColors.warning;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
      child: Text(
        status,
        style: TextStyle(
          color: fg,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final a = widget.analysis;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: InkWell(
        onTap: () => setState(() => _expanded = !_expanded),
        borderRadius: BorderRadius.circular(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row
            Row(
              children: [
                Icon(Icons.description_outlined,
                    color: AppColors.primary, size: 26),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    a.fileName,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary),
                  ),
                ),
                _statusChip(a.status),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              'Uploaded: ${a.uploadDate.day}/${a.uploadDate.month}/${a.uploadDate.year}   ${a.uploadDate.hour}:${a.uploadDate.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                  color: AppColors.textSecondary, fontSize: 13, height: 1.3),
            ),

            const SizedBox(height: 10),

            Text(
              a.resultSummary,
              maxLines: _expanded ? null : 2,
              overflow:
                  _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                height: 1.4,
              ),
            ),

            if (_expanded) ...[
              const SizedBox(height: 14),
              Divider(color: AppColors.border),
              const SizedBox(height: 12),
              Text(
                'Detailed Findings',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '''
Heart Rate: ${a.heartRate} bpm
Arrhythmias: ${a.arrhythmias.isEmpty ? 'None' : a.arrhythmias.join(', ')}
P wave: ${a.pWaveObservation}
QRS Complex: ${a.qrsComplexObservation}
T wave: ${a.tWaveObservation}

Recommendations:
${a.recommendations}
''',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.45,
                  color: AppColors.textSecondary,
                ),
              ),
            ],

            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                _expanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
                size: 26,
              ),
            )
          ],
        ),
      ),
    );
  }
}
