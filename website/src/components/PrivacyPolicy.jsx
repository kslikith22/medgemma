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
                Aarogenix ("we," "our," or "us"), registered in India, is committed to protecting the privacy and security 
                of your personal and health information. This Privacy Policy explains how we collect, use, disclose, and 
                safeguard your information when you use our hospital management system and ECG AI analysis platform.
              </p>
              <p className="mb-4">
                We comply with applicable data protection laws including:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>India:</strong> Digital Personal Data Protection Act (DPDP Act), 2023 and DPDP Rules 2025, Information Technology Act 2000, and SPDI Rules 2011</li>
                <li><strong>United States:</strong> Health Insurance Portability and Accountability Act (HIPAA) and Health Information Technology for Economic and Clinical Health (HITECH) Act</li>
                <li><strong>European Union:</strong> General Data Protection Regulation (GDPR)</li>
                <li><strong>Other Jurisdictions:</strong> Applicable local healthcare data protection laws where our services are used</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">2. Company Information</h2>
              <div className="bg-teal-50 p-6 rounded-lg">
                <p className="mb-2"><strong>Legal Entity:</strong> Avyaktha Intelligence Private Limited</p>
                <p className="mb-2"><strong>Registered Office:</strong> Avyaktha Intelligence, 123 Sports Lane, Bengaluru, India</p>
                {/* <p className="mb-2"><strong>CIN:</strong> [Company Identification Number]</p>
                <p className="mb-2"><strong>Email:</strong> contactus</p>
                <p className="mb-2"><strong>Data Protection Officer:</strong> [DPO Name]</p> */}
                <p><strong>Contact:</strong> contactus@avyakthaintelligence.com</p>
              </div>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">3. Information We Collect</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">3.1 Sensitive Personal Data / Protected Health Information (PHI)</h3>
              <p className="mb-3">We collect and process the following health information as per DPDP Act 2023 and HIPAA requirements:</p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>Patient demographic information (name, date of birth, address, contact details, Aadhaar/ID proof)</li>
                <li>Medical history, diagnoses, and clinical records</li>
                <li>Diagnostic information including ECG data, AI analysis results, and test reports</li>
                <li>Treatment plans, prescriptions, and medication records</li>
                <li>Appointment and consultation records</li>
                <li>Billing, payment, and insurance information</li>
                <li>Laboratory test results, medical imaging, and radiology reports</li>
                <li>Biometric data (if applicable for authentication)</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">3.2 Technical and Usage Information</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li>Device information (IP address, browser type, operating system, device identifiers)</li>
                <li>Usage data, access logs, and system activity</li>
                <li>Authentication credentials and login timestamps</li>
                <li>Session information, cookies, and similar tracking technologies</li>
                <li>Geolocation data (with consent)</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">4. Legal Basis for Processing (India & International)</h2>
              <p className="mb-3">We process your data on the following legal grounds:</p>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">4.1 For Indian Users (DPDP Act 2023)</h3>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li><strong>Consent:</strong> Explicit, free, specific, informed, and unambiguous consent obtained for processing sensitive personal data</li>
                <li><strong>Legitimate Uses:</strong> Medical treatment, employment purposes, and as permitted under Section 7 of DPDP Act</li>
                <li><strong>Legal Obligations:</strong> Compliance with Indian laws and regulations</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">4.2 For International Users</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>HIPAA (USA):</strong> Treatment, Payment, and Healthcare Operations (TPO)</li>
                <li><strong>GDPR (EU):</strong> Consent, legitimate interests, legal obligations, vital interests, and provision of healthcare services</li>
                <li><strong>Contractual Necessity:</strong> To fulfill our service obligations</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">5. How We Use Your Information</h2>
              <p className="mb-3">We process your data for the following purposes:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Treatment:</strong> Provide medical care, diagnosis, ECG AI analysis, and treatment services</li>
                <li><strong>Payment:</strong> Process billing, insurance claims, and payment transactions</li>
                <li><strong>Healthcare Operations:</strong> Improve quality of care, conduct research, train staff, and manage hospital operations</li>
                <li><strong>AI Development:</strong> Improve ECG analysis algorithms using anonymized/de-identified data</li>
                <li><strong>Communication:</strong> Send appointment reminders, test results, health alerts, and service updates</li>
                <li><strong>Legal Compliance:</strong> Comply with Indian and international legal obligations</li>
                <li><strong>Security:</strong> Prevent fraud, unauthorized access, and security threats</li>
                <li><strong>Analytics:</strong> Generate anonymized reports and statistics for service improvement</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">6. Data Security Measures</h2>
              <p className="mb-3">We implement robust security measures as required by DPDP Act 2023, SPDI Rules 2011, and international standards:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Encryption:</strong> AES-256 encryption for data at rest and TLS 1.3 for data in transit</li>
                <li><strong>Access Controls:</strong> Role-based access control (RBAC) with principle of least privilege</li>
                <li><strong>Authentication:</strong> Multi-factor authentication (MFA) mandatory for all healthcare providers</li>
                <li><strong>Audit Trails:</strong> Comprehensive logging of all data access and modifications (retained as per DPDP Rules)</li>
                <li><strong>Regular Audits:</strong> Annual Data Protection Impact Assessments (DPIA) and security audits</li>
                <li><strong>Employee Training:</strong> Mandatory training on DPDP Act, HIPAA, and data security practices</li>
                <li><strong>Physical Security:</strong> ISO 27001 certified data centers in India with redundancy and backup</li>
                <li><strong>Incident Response:</strong> 24/7 security monitoring and breach response protocols</li>
                <li><strong>Anonymization:</strong> Pseudonymization and anonymization techniques for research and analytics</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">7. Data Storage and Cross-Border Transfers</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">7.1 Data Storage Location</h3>
              <p className="mb-4">
                Primary data storage is maintained in secure data centers located in India. We comply with data localization 
                requirements under Indian law for sensitive personal data of Indian citizens.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.2 International Data Transfers</h3>
              <p className="mb-3">
                For international clients, we may transfer data outside India to countries with adequate data protection laws. 
                Such transfers comply with:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li>DPDP Act provisions for cross-border data transfers (to notified countries)</li>
                <li>GDPR Standard Contractual Clauses (SCCs) for EU data</li>
                <li>HIPAA Business Associate Agreements for US healthcare data</li>
                <li>Appropriate safeguards including contractual obligations and technical measures</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">8. Information Sharing and Disclosure</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">8.1 With Consent</h3>
              <p className="mb-4">
                We obtain explicit consent before sharing your data, except where permitted by law. Consent can be withdrawn 
                at any time through your account settings.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">8.2 Healthcare Providers</h3>
              <p className="mb-4">Information is shared with doctors, specialists, laboratories, and pharmacies involved in your care.</p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">8.3 Data Processors / Business Associates</h3>
              <p className="mb-3">We engage third-party service providers who have signed:</p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>Data Processing Agreements under DPDP Act and GDPR</li>
                <li>Business Associate Agreements (BAA) under HIPAA</li>
                <li>Confidentiality and security obligations</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">8.4 Legal and Regulatory Authorities</h3>
              <p className="mb-3">We disclose data when legally required:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Court orders, warrants, and legal processes in India or applicable jurisdictions</li>
                <li>Data Protection Board of India requests</li>
                <li>Public health authorities (disease surveillance, epidemic control)</li>
                <li>Law enforcement agencies (with valid legal authority)</li>
                <li>Medical Council of India and healthcare regulatory bodies</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">9. Your Rights as a Data Principal</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">9.1 Rights Under DPDP Act 2023 (Indian Users)</h3>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li><strong>Right to Access:</strong> Obtain information about personal data being processed</li>
                <li><strong>Right to Correction:</strong> Request correction of inaccurate or incomplete data</li>
                <li><strong>Right to Erasure:</strong> Request deletion of personal data (subject to legal retention requirements)</li>
                <li><strong>Right to Grievance Redressal:</strong> File complaints with our Data Protection Officer</li>
                <li><strong>Right to Nominate:</strong> Nominate another person to exercise rights in case of death or incapacity</li>
                <li><strong>Right to Withdraw Consent:</strong> Withdraw consent at any time (may affect service availability)</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">9.2 Additional Rights for International Users</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>HIPAA Rights (USA):</strong> Right to accounting of disclosures, right to restrict uses, right to confidential communications</li>
                <li><strong>GDPR Rights (EU):</strong> Right to data portability, right to object to processing, right to restrict processing, right to lodge complaint with supervisory authority</li>
                <li><strong>Right to Opt-Out:</strong> Marketing communications (does not apply to essential treatment communications)</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">9.3 How to Exercise Your Rights</h3>
              <p className="mb-3">Contact our Data Protection Officer:</p>
              <div className="bg-gray-50 p-4 rounded-lg">
                <p>Email: contactus@avyakthaintelligence.com</p>
                {/* <p>Phone: +91-[Your Number]</p> */}
                <p>Response Time: Within 30 days (DPDP Act) / 60 days (HIPAA) / 1 month (GDPR)</p>
              </div>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">10. Data Retention</h2>
              <p className="mb-3">We retain personal data as follows:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Medical Records:</strong> Minimum 3-5 years from last consultation (as per Medical Council of India guidelines) or longer if required by state laws</li>
                <li><strong>Financial Records:</strong> 7 years (as per Indian Companies Act and tax laws)</li>
                <li><strong>Consent Records:</strong> Duration of processing + 3 years (DPDP Act requirement)</li>
                <li><strong>Audit Logs:</strong> 3 years minimum (DPDP Rules 2025)</li>
                <li><strong>International Clients:</strong> As per applicable local retention laws (e.g., HIPAA: 6+ years)</li>
              </ul>
              <p className="mt-4">
                Data is securely destroyed after retention period using certified data destruction methods compliant with 
                ISO 27001 standards.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">11. Data Breach Notification</h2>
              <p className="mb-4">
                In case of a personal data breach, we will comply with notification requirements under applicable laws:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>India (DPDP Act):</strong> Notify Data Protection Board and affected individuals as prescribed in DPDP Rules 2025</li>
                <li><strong>USA (HIPAA):</strong> Notify affected individuals within 60 days, HHS, and media (if breach affects 500+ individuals)</li>
                <li><strong>EU (GDPR):</strong> Notify supervisory authority within 72 hours and affected individuals without undue delay</li>
                <li>Breach notification will include nature of breach, data affected, consequences, and remedial measures taken</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">12. Cookies and Tracking Technologies</h2>
              <p className="mb-3">We use cookies and similar technologies for:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Essential cookies: Required for platform functionality and security</li>
                <li>Analytics cookies: Understand usage patterns and improve services (with consent)</li>
                <li>Performance cookies: Optimize system performance and loading times</li>
              </ul>
              <p className="mt-4">
                You can manage cookie preferences through your browser settings. Note that disabling essential cookies may 
                affect platform functionality.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">13. Children's Privacy</h2>
              <p className="mb-4">
                Under DPDP Act 2023, we require verifiable parental/guardian consent for processing personal data of children 
                (under 18 years in India, under 13 in USA). Healthcare services for minors are provided with appropriate 
                guardian authorization as per Medical Council of India guidelines.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">14. Automated Decision-Making and AI</h2>
              <p className="mb-4">
                Our ECG AI analysis system uses automated processing to provide diagnostic insights. However:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li>AI results are advisory only and must be reviewed by qualified healthcare professionals</li>
                <li>You have the right to request human review of AI-generated results</li>
                <li>We conduct regular audits to ensure AI systems do not discriminate or violate patient rights</li>
                <li>AI models are trained on anonymized datasets compliant with DPDP Act requirements</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">15. Third-Party Links and Services</h2>
              <p>
                Our platform may contain links to third-party websites or integrate with external services (payment gateways, 
                insurance portals). We are not responsible for their privacy practices. Please review their privacy policies 
                before sharing information.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">16. Updates to Privacy Policy</h2>
              <p>
                We may update this Privacy Policy to reflect changes in laws, regulations, or business practices. Material 
                changes will be notified via email and prominent platform notice at least 30 days before taking effect. 
                Continued use after changes constitutes acceptance.
              </p>
            </section>

            <section>
              {/* <h2 className="text-2xl font-bold text-gray-900 mb-4">17. Contact and Grievance Redressal</h2> */}
              
              {/* <div className="bg-teal-50 p-6 rounded-lg mb-4">
                <h3 className="font-semibold text-lg mb-3">Data Protection Officer (India)</h3>
                <p>Name: [DPO Name]</p>
                <p>Email: contactus@avyakthaintelligence.com</p>
                <p>Phone: +91-[Phone Number]</p>
                <p>Address: [Registered Office Address]</p>
              </div>

              <div className="bg-blue-50 p-6 rounded-lg mb-4">
                <h3 className="font-semibold text-lg mb-3">HIPAA Privacy Officer (International Clients)</h3>
                <p>Email: contactus@avyakthaintelligence.com</p>
                <p>Phone: +1-[Phone Number]</p>
              </div> */}

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-6">File a Complaint</h3>
              <p className="mb-3">If you believe your privacy rights have been violated:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>India:</strong> File complaint with Data Protection Board of India at <span className="text-teal-600">www.dpb.gov.in</span></li>
                <li><strong>USA:</strong> File complaint with Office for Civil Rights (OCR), HHS at <span className="text-teal-600">www.hhs.gov/ocr/privacy</span></li>
                <li><strong>EU:</strong> File complaint with your local Data Protection Authority</li>
              </ul>
              <p className="mt-4 font-semibold">
                No retaliation: Filing a complaint will not affect your healthcare services or account status.
              </p>
            </section>

            <div className="mt-12 pt-8 border-t-2 border-teal-500">
              <p className="text-sm text-gray-600 italic">
                This Privacy Policy is compliant with the Digital Personal Data Protection Act 2023, DPDP Rules 2025 (India), 
                HIPAA/HITECH Act (USA), GDPR (EU), and applicable healthcare data protection regulations worldwide.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default PrivacyPolicy
