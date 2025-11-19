// src/components/PrivacyPolicy.jsx
function PrivacyPolicy() {
  return (
    <div className="min-h-screen bg-gray-50 py-12">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="bg-white rounded-2xl shadow-lg p-8 md:p-12">
          <h1 className="text-4xl font-bold text-gray-900 mb-4">Privacy Policy</h1>
          <p className="text-gray-600 mb-8">Last Updated: November 20, 2025</p>

          <div className="space-y-8 text-gray-700">
            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">1. Introduction</h2>
              <p className="mb-4">
                Aarogenix ("we," "our," or "us") is committed to protecting the privacy and security of your personal 
                and health information. This Privacy Policy explains how we collect, use, disclose, and safeguard your 
                information when you use our hospital management system and ECG AI analysis platform.
              </p>
              <p>
                We comply with the Health Insurance Portability and Accountability Act (HIPAA), the Health Information 
                Technology for Economic and Clinical Health (HITECH) Act, and other applicable data protection regulations.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">2. Information We Collect</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">2.1 Protected Health Information (PHI)</h3>
              <p className="mb-3">We collect and process the following types of health information:</p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>Patient demographic information (name, date of birth, address, contact details)</li>
                <li>Medical history and clinical records</li>
                <li>Diagnostic information including ECG data and AI analysis results</li>
                <li>Treatment plans and prescriptions</li>
                <li>Appointment and consultation records</li>
                <li>Billing and insurance information</li>
                <li>Laboratory test results and medical imaging</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">2.2 Technical Information</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li>Device information (IP address, browser type, operating system)</li>
                <li>Usage data and system logs</li>
                <li>Authentication credentials and access logs</li>
                <li>Session information and cookies</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">3. How We Use Your Information</h2>
              <p className="mb-3">We use your information for the following purposes:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Treatment:</strong> To provide medical care, diagnosis, and treatment services</li>
                <li><strong>Payment:</strong> To process billing, insurance claims, and payment transactions</li>
                <li><strong>Healthcare Operations:</strong> To improve quality of care, train staff, and manage hospital operations</li>
                <li><strong>AI Analysis:</strong> To perform ECG analysis and provide diagnostic insights</li>
                <li><strong>Communication:</strong> To send appointment reminders, test results, and health notifications</li>
                <li><strong>Legal Compliance:</strong> To comply with legal obligations and regulatory requirements</li>
                <li><strong>Security:</strong> To protect against fraud, unauthorized access, and security threats</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">4. Data Security Measures</h2>
              <p className="mb-3">We implement comprehensive security measures to protect your information:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Encryption:</strong> End-to-end encryption for data in transit and at rest using industry-standard protocols (AES-256)</li>
                <li><strong>Access Controls:</strong> Role-based access control (RBAC) ensuring only authorized personnel can access PHI</li>
                <li><strong>Authentication:</strong> Multi-factor authentication (MFA) for all user accounts</li>
                <li><strong>Audit Logs:</strong> Comprehensive logging and monitoring of all data access and modifications</li>
                <li><strong>Regular Assessments:</strong> Periodic security audits and vulnerability assessments</li>
                <li><strong>Employee Training:</strong> Regular HIPAA and security awareness training for all staff</li>
                <li><strong>Physical Security:</strong> Secure data centers with restricted access and environmental controls</li>
                <li><strong>Backup & Recovery:</strong> Automated backups and disaster recovery procedures</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">5. Information Sharing and Disclosure</h2>
              <p className="mb-3">We may share your information in the following circumstances:</p>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">5.1 With Your Consent</h3>
              <p className="mb-4">We will obtain your written authorization before sharing your PHI except as permitted by law.</p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">5.2 Healthcare Providers</h3>
              <p className="mb-4">We share information with doctors, specialists, and other healthcare providers involved in your care.</p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">5.3 Business Associates</h3>
              <p className="mb-4">We may share information with third-party service providers who have signed Business Associate Agreements (BAAs) and are bound by HIPAA compliance requirements.</p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">5.4 Legal Requirements</h3>
              <p className="mb-3">We may disclose information when required by law, including:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Court orders and subpoenas</li>
                <li>Public health reporting requirements</li>
                <li>Law enforcement investigations</li>
                <li>National security purposes</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">6. Your Rights</h2>
              <p className="mb-3">You have the following rights regarding your health information:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Right to Access:</strong> Request copies of your medical records and health information</li>
                <li><strong>Right to Amendment:</strong> Request corrections to inaccurate or incomplete information</li>
                <li><strong>Right to Accounting:</strong> Receive a list of disclosures of your PHI</li>
                <li><strong>Right to Restriction:</strong> Request limitations on how your information is used or shared</li>
                <li><strong>Right to Confidential Communication:</strong> Request communication through alternative means or locations</li>
                <li><strong>Right to Revoke Authorization:</strong> Withdraw previously given consent (except where action has already been taken)</li>
                <li><strong>Right to Notification:</strong> Be notified of any breach of your unsecured PHI</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">7. Data Retention</h2>
              <p>
                We retain your health information for the period required by applicable laws and regulations. Medical records 
                are typically maintained for a minimum of 7 years from the date of last treatment, or longer if required by 
                state law. After the retention period, data is securely destroyed using industry-standard methods.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">8. Breach Notification</h2>
              <p>
                In the event of a data breach affecting your PHI, we will notify you within 60 days of discovering the breach 
                in accordance with HIPAA requirements. We will also notify the Department of Health and Human Services (HHS) 
                and, if applicable, local media outlets.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">9. Children's Privacy</h2>
              <p>
                Our services are not directed to children under 13. We do not knowingly collect information from children 
                without parental consent. Healthcare information for minors is handled in accordance with applicable laws 
                and with appropriate parental or guardian authorization.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">10. International Data Transfers</h2>
              <p>
                If you are accessing our services from outside your country, please note that your information may be 
                transferred to and processed in countries with different data protection laws. We ensure appropriate 
                safeguards are in place for international transfers.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">11. Updates to Privacy Policy</h2>
              <p>
                We may update this Privacy Policy periodically to reflect changes in our practices or applicable laws. 
                We will post the updated policy with a new "Last Updated" date. Material changes will be communicated 
                to you via email or prominent notice on our platform.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">12. Contact Information</h2>
              <p className="mb-3">For questions about this Privacy Policy or to exercise your rights, contact us:</p>
              <div className="bg-gray-50 p-6 rounded-lg">
                <p className="font-semibold mb-2">Aarogenix Privacy Officer</p>
                <p>Email: privacy@aarogenix.com</p>
                <p>Phone: +1 (800) 123-4567</p>
                <p>Address: 123 Healthcare Drive, Medical City, ST 12345</p>
              </div>
              <p className="mt-4">
                <strong>File a Complaint:</strong> If you believe your privacy rights have been violated, you may file a 
                complaint with us or with the Office for Civil Rights (OCR) of the U.S. Department of Health and Human 
                Services at <span className="text-teal-600">www.hhs.gov/ocr/privacy</span>
              </p>
            </section>
          </div>
        </div>
      </div>
    </div>
  )
}

export default PrivacyPolicy
