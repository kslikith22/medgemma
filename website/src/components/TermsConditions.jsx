// src/components/TermsConditions.jsx
function TermsConditions() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="bg-white rounded-2xl shadow-lg p-8 md:p-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Terms and Conditions</h1>
          <p className="text-gray-600 mb-8">Last Updated: November 20, 2025</p>

          <div className="space-y-8 text-gray-700">
            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">1. Acceptance of Terms</h2>
              <p>
                Welcome to Aarogenix. These Terms and Conditions ("Terms") govern your access to and use of our hospital 
                management system, including ECG AI analysis services, OMS integration, and related features (collectively, 
                the "Services"). By accessing or using our Services, you agree to be bound by these Terms and our Privacy Policy.
              </p>
              <p className="mt-4">
                If you are using the Services on behalf of a healthcare organization, you represent that you have the authority 
                to bind that organization to these Terms.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">2. Service Description</h2>
              <p className="mb-3">Aarogenix provides:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Comprehensive hospital management software including patient registration, appointment scheduling, and medical records management</li>
                <li>Outpatient Management System (OMS) with queue management and consultation tracking</li>
                <li>AI-powered ECG analysis and diagnostic support</li>
                <li>Billing, pharmacy, and inventory management tools</li>
                <li>Analytics dashboards and reporting capabilities</li>
                <li>Mobile and web-based access for healthcare providers and patients</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">3. User Accounts and Registration</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">3.1 Account Creation</h3>
              <p className="mb-4">
                To use our Services, you must create an account and provide accurate, complete information. You are responsible 
                for maintaining the confidentiality of your login credentials and for all activities under your account.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">3.2 User Types</h3>
              <p className="mb-3">Our platform supports different user roles:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Healthcare Administrators:</strong> Full access to system settings and management</li>
                <li><strong>Doctors/Physicians:</strong> Access to patient records, diagnostics, and clinical tools</li>
                <li><strong>Nurses/Staff:</strong> Limited access based on assigned responsibilities</li>
                <li><strong>Patients:</strong> Access to personal health records, appointments, and test results</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">3.3 Account Security</h3>
              <p>
                You must immediately notify us of any unauthorized use of your account. We are not liable for losses caused 
                by unauthorized use of your credentials.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">4. Acceptable Use Policy</h2>
              <p className="mb-3">You agree NOT to:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Use the Services for any unlawful purpose or in violation of applicable regulations</li>
                <li>Access or attempt to access accounts or data without authorization</li>
                <li>Interfere with or disrupt the Services or servers</li>
                <li>Reverse engineer, decompile, or attempt to extract source code</li>
                <li>Upload malicious code, viruses, or harmful content</li>
                <li>Misuse patient data or violate HIPAA regulations</li>
                <li>Share your login credentials with unauthorized parties</li>
                <li>Use automated systems to scrape or extract data</li>
                <li>Resell or redistribute the Services without permission</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">5. Medical Disclaimer</h2>
              <div className="bg-yellow-50 border-l-4 border-yellow-400 p-6 mb-4">
                <p className="font-semibold text-yellow-800 mb-2">IMPORTANT MEDICAL NOTICE</p>
                <p className="text-yellow-800">
                  Aarogenix is a healthcare management and diagnostic support tool. It does not replace professional 
                  medical judgment. Our AI-powered ECG analysis is designed to assist healthcare professionals, not to 
                  provide definitive diagnoses.
                </p>
              </div>
              <ul className="list-disc pl-6 space-y-2">
                <li>All diagnostic results must be reviewed and interpreted by qualified healthcare professionals</li>
                <li>Clinical decisions should be based on comprehensive patient evaluation, not solely on AI analysis</li>
                <li>The Services are not intended for emergency medical situations</li>
                <li>Healthcare providers remain solely responsible for patient care decisions</li>
                <li>We do not practice medicine or provide medical advice</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">6. Subscription and Payments</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">6.1 Fees</h3>
              <p className="mb-4">
                Access to the Services requires a paid subscription. Fees are based on your selected plan and number of users. 
                All fees are exclusive of applicable taxes unless stated otherwise.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">6.2 Billing</h3>
              <p className="mb-4">
                Subscriptions are billed in advance on a monthly or annual basis. You authorize us to charge your payment 
                method on each billing cycle. Payments are non-refundable except as required by law.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">6.3 Renewal and Cancellation</h3>
              <p>
                Subscriptions automatically renew unless canceled at least 30 days before the renewal date. You may cancel 
                your subscription through your account settings or by contacting support.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">7. Data Ownership and License</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">7.1 Your Data</h3>
              <p className="mb-4">
                You retain all rights to your data, including patient health information. We do not claim ownership of any 
                data you upload or generate using our Services.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.2 License to Us</h3>
              <p className="mb-4">
                You grant us a limited license to host, store, process, and transmit your data solely to provide the Services. 
                We may use anonymized, de-identified data for analytics and service improvement purposes.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.3 Our Intellectual Property</h3>
              <p>
                The Services, including software, AI algorithms, design, and content, are owned by Aarogenix and protected 
                by copyright, trademark, and other intellectual property laws. You receive a limited, non-exclusive license 
                to use the Services.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">8. HIPAA Compliance and Business Associate Agreement</h2>
              <p className="mb-4">
                As a provider of healthcare technology services, we act as a Business Associate under HIPAA. By using our 
                Services, healthcare organizations agree to the terms of our Business Associate Agreement (BAA), which is 
                incorporated into these Terms.
              </p>
              <p className="mb-3">We comply with HIPAA requirements including:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Implementing appropriate administrative, physical, and technical safeguards</li>
                <li>Ensuring the confidentiality, integrity, and availability of PHI</li>
                <li>Reporting breaches within required timeframes</li>
                <li>Providing access to PHI as required by law</li>
                <li>Maintaining audit logs and documentation</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">9. Service Level and Availability</h2>
              <p className="mb-3">We strive to provide:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>99.9% Uptime:</strong> Subject to scheduled maintenance and force majeure events</li>
                <li><strong>24/7 Support:</strong> Technical support for critical issues</li>
                <li><strong>Regular Updates:</strong> Feature enhancements and security patches</li>
                <li><strong>Data Backups:</strong> Automated daily backups with disaster recovery capabilities</li>
              </ul>
              <p className="mt-4">
                We do not guarantee uninterrupted access. Scheduled maintenance will be communicated in advance when possible.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">10. Limitation of Liability</h2>
              <div className="bg-red-50 border-l-4 border-red-400 p-6">
                <p className="font-semibold text-red-800 mb-2">LIABILITY DISCLAIMER</p>
                <p className="text-red-800 mb-3">
                  TO THE MAXIMUM EXTENT PERMITTED BY LAW, Aarogenix SHALL NOT BE LIABLE FOR:
                </p>
                <ul className="list-disc pl-6 space-y-2 text-red-800">
                  <li>Any indirect, incidental, special, consequential, or punitive damages</li>
                  <li>Loss of profits, data, or business opportunities</li>
                  <li>Medical errors or misdiagnoses resulting from use of AI analysis tools</li>
                  <li>Damages exceeding the fees paid in the 12 months preceding the claim</li>
                </ul>
                <p className="text-red-800 mt-3">
                  Healthcare providers are solely responsible for clinical decisions and patient care.
                </p>
              </div>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">11. Indemnification</h2>
              <p>
                You agree to indemnify and hold harmless Aarogenix from any claims, damages, losses, or expenses 
                (including legal fees) arising from: (a) your use of the Services; (b) violation of these Terms; 
                (c) violation of any rights of third parties; or (d) medical malpractice or negligence in patient care.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">12. Termination</h2>
              <p className="mb-3">
                We may suspend or terminate your access to the Services:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li>For violation of these Terms or applicable laws</li>
                <li>For non-payment of fees</li>
                <li>If we cease operations</li>
                <li>For any reason with 30 days' notice</li>
              </ul>
              <p className="mt-4">
                Upon termination, you will have 30 days to export your data. After this period, we may delete your data 
                in accordance with our data retention policies.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">13. Modifications to Terms</h2>
              <p>
                We reserve the right to modify these Terms at any time. Material changes will be communicated via email 
                or platform notification at least 30 days before taking effect. Continued use of the Services after changes 
                constitutes acceptance of the modified Terms.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">14. Governing Law and Dispute Resolution</h2>
              <p className="mb-4">
                These Terms are governed by the laws of [Your State/Country], without regard to conflict of law principles.
              </p>
              <p className="mb-4">
                Any disputes will first be subject to good-faith negotiation. If unresolved after 30 days, disputes shall 
                be resolved through binding arbitration in accordance with the rules of the American Arbitration Association.
              </p>
              <p>
                You waive any right to participate in class action lawsuits or class-wide arbitration.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">15. Miscellaneous</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">15.1 Entire Agreement</h3>
              <p className="mb-4">
                These Terms, together with our Privacy Policy and BAA, constitute the entire agreement between you and Aarogenix.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">15.2 Severability</h3>
              <p className="mb-4">
                If any provision is found unenforceable, the remaining provisions will continue in full effect.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">15.3 No Waiver</h3>
              <p className="mb-4">
                Failure to enforce any provision does not constitute a waiver of that provision.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">15.4 Assignment</h3>
              <p>
                You may not assign these Terms without our written consent. We may assign these Terms in connection with 
                a merger, acquisition, or sale of assets.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">16. Contact Information</h2>
              <p className="mb-3">For questions about these Terms, contact us:</p>
              <div className="bg-gray-50 p-6 rounded-lg">
                <p className="font-semibold mb-2">Aarogenix Legal Department</p>
                <p>Email: legal@aarogenix.com</p>
                <p>Phone: +1 (800) 123-4567</p>
                <p>Address: 123 Healthcare Drive, Medical City, ST 12345</p>
              </div>
            </section>

            <div className="mt-12 pt-8 border-t border-gray-300">
              <p className="text-sm text-gray-600">
                By using Aarogenix Services, you acknowledge that you have read, understood, and agree to be bound by 
                these Terms and Conditions.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default TermsConditions
