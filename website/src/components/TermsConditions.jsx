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
              <p className="mb-4">
                Welcome to Avyaktha Intelligence Private Limited ("Company," "we," "our," or "us"), a company incorporated and registered 
                in India. These Terms and Conditions ("Terms") govern your access to and use of our hospital management system, 
                including ECG AI analysis services, OMS integration, and related features (collectively, the "Services").
              </p>
              <p className="mb-4">
                By accessing or using our Services, you agree to be bound by these Terms, our Privacy Policy, and applicable 
                laws of India and your jurisdiction. If you are using the Services on behalf of a healthcare organization, you 
                represent that you have the authority to bind that organization to these Terms.
              </p>
              <p className="font-semibold">
                Registered Office: Avyaktha Intelligence, 123 Sports Lane, Bengaluru, India<br/>
                {/* CIN: [Company Identification Number]<br/> */}
                Email: contactus@avyakthaintelligence.com
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">2. Jurisdiction and Applicable Laws</h2>
              <p className="mb-3">These Terms are governed by:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Indian Users:</strong> Laws of India, including but not limited to:
                  <ul className="list-circle pl-6 mt-2 space-y-1">
                    <li>Information Technology Act, 2000 and SPDI Rules 2011</li>
                    <li>Digital Personal Data Protection Act, 2023 and DPDP Rules 2025</li>
                    <li>Indian Contract Act, 1872</li>
                    <li>Consumer Protection Act, 2019</li>
                    <li>Medical Council of India regulations</li>
                  </ul>
                </li>
                <li><strong>International Users:</strong> Indian laws apply to extent not inconsistent with mandatory laws of your jurisdiction, including HIPAA (USA), GDPR (EU), and local healthcare regulations</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">3. Service Description</h2>
              <p className="mb-3">Aarogenix provides comprehensive healthcare IT solutions including:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Hospital Management System with patient registration, appointment scheduling, and EMR/EHR management</li>
                <li>Outpatient Management System (OMS) with queue management and consultation workflows</li>
                <li>AI-powered ECG analysis and diagnostic support tools</li>
                <li>Pharmacy management, inventory control, and billing systems</li>
                <li>Laboratory information management and reporting</li>
                <li>Insurance claim processing and revenue cycle management</li>
                <li>Analytics dashboards and business intelligence tools</li>
                <li>Mobile and web-based access for healthcare providers, staff, and patients</li>
                <li>Integration capabilities with existing hospital systems</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">4. Eligibility and Account Registration</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">4.1 Eligibility</h3>
              <p className="mb-4">
                To use our Services, you must be: (i) a registered healthcare organization in India or your country with valid 
                medical practice licenses; (ii) a qualified healthcare professional with appropriate credentials; (iii) a patient 
                with valid consent; or (iv) authorized representative of the above.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">4.2 Account Creation</h3>
              <p className="mb-4">
                You must provide accurate, complete, and current information during registration as required under DPDP Act 2023. 
                Providing false information may result in account termination and legal action under relevant Indian laws.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">4.3 User Roles and Access Levels</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>Super Administrator:</strong> Full system access and configuration (hospital management)</li>
                <li><strong>Doctors/Physicians:</strong> Access to patient records, diagnostics, prescriptions, and clinical tools</li>
                <li><strong>Nurses and Clinical Staff:</strong> Role-based access to patient care modules</li>
                <li><strong>Administrative Staff:</strong> Billing, scheduling, and operational functions</li>
                <li><strong>Patients:</strong> Personal health records, appointments, test results, and telemedicine access</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">4.4 Account Security</h3>
              <p className="mb-3">You are responsible for:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Maintaining confidentiality of login credentials (non-disclosure required under IT Act 2000)</li>
                <li>Enabling multi-factor authentication (MFA) for healthcare provider accounts</li>
                <li>Immediately notifying us of unauthorized access or security breaches</li>
                <li>All activities conducted under your account, including compliance with medical ethics</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">5. Acceptable Use Policy</h2>
              <p className="mb-3">You agree NOT to:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Use the Services for unlawful purposes or in violation of Indian laws, DPDP Act 2023, or international healthcare regulations</li>
                <li>Access patient data without proper authorization or medical necessity (violation may result in prosecution under IT Act Section 43, 66)</li>
                <li>Share login credentials or allow unauthorized persons to access the system</li>
                <li>Upload malicious code, viruses, or conduct cyberattacks (punishable under IT Act Section 66, 66B, 66C)</li>
                <li>Reverse engineer, decompile, or attempt to extract source code (violation of intellectual property rights)</li>
                <li>Scrape, mine, or extract data using automated tools without authorization</li>
                <li>Interfere with or disrupt Services, servers, or networks</li>
                <li>Violate patient confidentiality or medical ethics guidelines</li>
                <li>Misuse AI analysis tools or present AI results as definitive medical diagnoses</li>
                <li>Resell, redistribute, or sublicense the Services without written permission</li>
                <li>Use Services for medical research without appropriate ethics committee approval</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">6. Medical Disclaimer and Liability</h2>
              
              <div className="bg-yellow-50 border-l-4 border-yellow-500 p-6 mb-4">
                <p className="font-bold text-yellow-900 mb-3 text-lg">⚠️ CRITICAL MEDICAL NOTICE</p>
                <p className="text-yellow-900 mb-3">
                  Aarogenix is a healthcare management and diagnostic support tool. It does NOT replace professional 
                  medical judgment, diagnosis, or treatment by qualified healthcare professionals registered with Medical 
                  Council of India or equivalent regulatory bodies.
                </p>
                <ul className="list-disc pl-6 space-y-2 text-yellow-900">
                  <li>Our AI-powered ECG analysis provides <strong>advisory insights only</strong></li>
                  <li>All diagnostic results MUST be reviewed and interpreted by qualified cardiologists or physicians</li>
                  <li>Clinical decisions must be based on comprehensive patient evaluation, not solely on AI output</li>
                  <li>The Services are NOT intended for emergency medical situations - always call emergency services</li>
                  <li>Healthcare providers remain solely and exclusively responsible for patient care decisions</li>
                  <li>We do not practice medicine, provide medical advice, or establish doctor-patient relationships</li>
                </ul>
              </div>

              <p className="font-semibold">
                Professional Responsibility: Healthcare providers using our Services must maintain valid medical registration, 
                professional indemnity insurance, and comply with all applicable medical council regulations.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">7. Subscription, Pricing, and Payments</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">7.1 Subscription Plans</h3>
              <p className="mb-4">
                Access to Services requires a paid subscription. Plans are customized based on hospital size, number of users, 
                features required, and deployment model (cloud/on-premise).
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.2 Fees and Taxes</h3>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>All fees are in Indian Rupees (INR) for Indian clients, or USD/local currency for international clients</li>
                <li>Fees are exclusive of applicable taxes including GST (18% in India) unless stated otherwise</li>
                <li>Pricing may vary by region to account for currency conversion and local tax requirements</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.3 Billing and Payment Terms</h3>
              <p className="mb-3">
                Subscriptions are billed in advance on monthly, quarterly, or annual basis as per your chosen plan:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Payment methods: Credit/Debit cards, Net Banking, UPI, NEFT/RTGS, International wire transfer</li>
                <li>Invoice will be issued in compliance with Indian GST regulations</li>
                <li>Payment due within 15 days of invoice date (or as per negotiated terms for enterprise clients)</li>
                <li>Late payment may result in interest charges @ 1.5% per month or maximum permitted by law</li>
                <li>Non-payment beyond 30 days may result in service suspension</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.4 Refund Policy</h3>
              <p className="mb-4">
                Payments are generally non-refundable except: (i) as required by Consumer Protection Act 2019; (ii) in case 
                of Service unavailability exceeding SLA commitments; (iii) within 7 days of initial purchase for new customers 
                (subject to no data usage). Refund processing takes 10-15 business days.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">7.5 Renewal and Cancellation</h3>
              <p>
                Subscriptions auto-renew unless canceled at least 30 days before renewal date. Cancellation can be initiated 
                through account settings or by written notice to support@avyakthaintelligence.com. Data export must be completed within 
                30 days post-cancellation.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">8. Data Ownership, License, and Intellectual Property</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">8.1 Your Data Ownership</h3>
              <p className="mb-4">
                You retain complete ownership of all patient health information, medical records, and data uploaded to our 
                Services ("Your Data"). We do not claim any proprietary rights over Your Data. Your Data remains subject to 
                DPDP Act 2023, IT Act 2000, and applicable data protection laws.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">8.2 License to Process Your Data</h3>
              <p className="mb-4">
                You grant us a limited, non-exclusive, royalty-free license to host, store, process, transmit, and display 
                Your Data solely to provide and improve the Services. This includes:
              </p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>Processing data through AI algorithms for ECG analysis and diagnostic support</li>
                <li>Using anonymized, de-identified, aggregated data for analytics, research, and service improvement</li>
                <li>Sharing data with Data Processors / Business Associates under strict confidentiality obligations</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">8.3 Our Intellectual Property</h3>
              <p className="mb-3">
                The Services, including software code, AI algorithms, machine learning models, user interface, design, 
                documentation, and trademarks are owned by Aarogenix and protected under:
              </p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Copyright Act, 1957 (India)</li>
                <li>Patents Act, 1970 (pending patent applications for AI algorithms)</li>
                <li>Trademarks Act, 1999</li>
                <li>Information Technology Act, 2000</li>
                <li>Trade Secrets and confidential business information</li>
              </ul>
              <p className="mt-4">
                You receive a limited, non-exclusive, non-transferable license to access and use the Services during your 
                subscription period. No source code, proprietary algorithms, or intellectual property is transferred to you.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">9. Regulatory Compliance</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">9.1 India - DPDP Act and Healthcare Regulations</h3>
              <p className="mb-3">We comply with:</p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>Digital Personal Data Protection Act, 2023 and DPDP Rules 2025</li>
                <li>Information Technology Act, 2000 and SPDI Rules 2011</li>
                <li>Indian Medical Council (Professional Conduct, Etiquette and Ethics) Regulations, 2002</li>
                <li>Clinical Establishments (Registration and Regulation) Act, 2010</li>
                <li>Drugs and Cosmetics Act, 1940 (for pharmacy module)</li>
                <li>Telemedicine Practice Guidelines 2020 (for telehealth features)</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">9.2 International Compliance</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>USA:</strong> HIPAA, HITECH Act - We act as Business Associate and provide BAA to covered entities</li>
                <li><strong>European Union:</strong> GDPR compliance for EU clients including Data Processing Agreements</li>
                <li><strong>Other Jurisdictions:</strong> Compliance with local healthcare data protection laws where Services are used</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">9.3 Audit and Inspection Rights</h3>
              <p>
                Healthcare clients have the right to audit our security and compliance practices upon reasonable notice 
                (subject to confidentiality agreements). We cooperate with Data Protection Board of India and regulatory 
                authorities as required by law.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">10. Service Level Agreement (SLA)</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">10.1 Uptime Commitment</h3>
              <p className="mb-4">
                We strive to provide 99.5% uptime (measured monthly), excluding scheduled maintenance and force majeure events. 
                Scheduled maintenance will be communicated at least 48 hours in advance.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">10.2 Support Services</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li><strong>24/7 Technical Support:</strong> For critical system issues affecting patient care</li>
                <li><strong>Business Hours Support:</strong> 9 AM - 6 PM IST for general queries and training</li>
                <li><strong>Response Time:</strong> Critical issues within 1 hour; Medium priority within 4 hours; Low priority within 24 hours</li>
                <li><strong>Support Channels:</strong> Phone (+91-[Number]), Email (support@avyakthaintelligence.com), In-app chat</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">10.3 Data Backup and Recovery</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li>Automated daily backups with 30-day retention</li>
                <li>Geo-redundant storage across multiple data centers in India</li>
                <li>Disaster recovery RTO (Recovery Time Objective): 4 hours</li>
                <li>RPO (Recovery Point Objective): 24 hours maximum data loss</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">11. Limitation of Liability</h2>
              
              <div className="bg-red-50 border-l-4 border-red-500 p-6 mb-4">
                <p className="font-bold text-red-900 mb-3 text-lg">LIABILITY DISCLAIMER</p>
                <p className="text-red-900 mb-3">
                  TO THE MAXIMUM EXTENT PERMITTED BY INDIAN LAW AND SUBJECT TO CONSUMER PROTECTION ACT 2019, AAROGENIX
                  SHALL NOT BE LIABLE FOR:
                </p>
                <ul className="list-disc pl-6 space-y-2 text-red-900">
                  <li>Indirect, incidental, special, consequential, punitive, or exemplary damages</li>
                  <li>Loss of profits, revenue, data, business opportunities, or goodwill</li>
                  <li><strong>Medical errors, misdiagnoses, or adverse patient outcomes</strong> resulting from clinical decisions made using our Services</li>
                  <li>Unauthorized access to data due to your security lapses (weak passwords, credential sharing)</li>
                  <li>Third-party actions, content, or services integrated with our platform</li>
                  <li>Force majeure events including natural disasters, war, strikes, government actions, or pandemics</li>
                  <li>Damages exceeding the total fees paid by you in the 12 months preceding the claim</li>
                </ul>
                <p className="text-red-900 mt-4 font-semibold">
                  Healthcare providers are solely and exclusively responsible for all clinical decisions, patient care, 
                  medical diagnoses, and treatment plans. Our Services are tools to assist, not replace, professional medical judgment.
                </p>
              </div>

              <p className="text-sm text-gray-600 italic">
                Note: Nothing in these Terms excludes or limits liability for death or personal injury caused by negligence, 
                fraud, or any liability that cannot be excluded under Indian law.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">12. Indemnification</h2>
              <p className="mb-3">You agree to indemnify, defend, and hold harmless Aarogenix, its directors, officers, employees, and affiliates from any claims, damages, losses, liabilities, and expenses (including reasonable legal fees) arising from:</p>
              <ul className="list-disc pl-6 space-y-2">
                <li>Your use or misuse of the Services</li>
                <li>Violation of these Terms or applicable laws (DPDP Act, IT Act, medical regulations)</li>
                <li>Violation of third-party rights including patient privacy and confidentiality</li>
                <li>Medical malpractice, negligence, or errors in patient care or diagnosis</li>
                <li>Unauthorized disclosure of patient data or breach of medical ethics</li>
                <li>Infringement of intellectual property rights</li>
                <li>Claims by patients, regulatory authorities, or third parties related to your use of Services</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">13. Termination and Suspension</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">13.1 Termination by You</h3>
              <p className="mb-4">
                You may terminate your subscription at any time with 30 days' written notice. No refunds will be provided 
                for unused subscription periods unless required by Consumer Protection Act 2019.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">13.2 Termination/Suspension by Us</h3>
              <p className="mb-3">We may suspend or terminate your access immediately without notice if:</p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>You violate these Terms, Privacy Policy, or applicable laws</li>
                <li>You fail to pay fees within 30 days of due date</li>
                <li>You engage in fraudulent activities or cyberattacks</li>
                <li>You compromise patient safety or violate medical ethics</li>
                <li>We receive legal or regulatory orders requiring suspension</li>
                <li>Your account is used for illegal activities</li>
              </ul>

              <p className="mb-3">We may terminate with 30 days' notice if:</p>
              <ul className="list-disc pl-6 space-y-2 mb-4">
                <li>We cease operations or discontinue Services</li>
                <li>For any reason at our discretion (with refund of unused subscription on pro-rata basis)</li>
              </ul>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">13.3 Effect of Termination</h3>
              <ul className="list-disc pl-6 space-y-2">
                <li>You must immediately cease using the Services</li>
                <li>You have 30 days to export Your Data in standard formats (CSV, PDF, HL7, FHIR)</li>
                <li>After 30 days, we may delete Your Data in accordance with data retention policies</li>
                <li>All license rights granted to you terminate immediately</li>
                <li>Sections related to liability, indemnification, and dispute resolution survive termination</li>
              </ul>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">14. Dispute Resolution and Governing Law</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">14.1 Governing Law</h3>
              <p className="mb-4">
                These Terms shall be governed by and construed in accordance with the laws of India. The courts of 
                [Your City], [State], India shall have exclusive jurisdiction over any disputes.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">14.2 Dispute Resolution Process</h3>
              <p className="mb-3">In case of any dispute:</p>
              <ol className="list-decimal pl-6 space-y-3 mb-4">
                <li><strong>Negotiation (30 days):</strong> Parties will first attempt good-faith negotiations to resolve the dispute</li>
                <li><strong>Mediation (30 days):</strong> If unresolved, parties agree to mediation under Indian Mediation Rules</li>
                <li><strong>Arbitration:</strong> If mediation fails, disputes shall be resolved through binding arbitration under Arbitration and Conciliation Act, 1996:
                  <ul className="list-disc pl-6 mt-2 space-y-1">
                    <li>Seat of arbitration: [Your City], India</li>
                    <li>Language: English</li>
                    <li>Number of arbitrators: One (for claims under ₹50 lakhs) or Three (for higher amounts)</li>
                    <li>Arbitration institution: Indian Council of Arbitration or as mutually agreed</li>
                  </ul>
                </li>
              </ol>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">14.3 Class Action Waiver</h3>
              <p>
                You waive any right to participate in class action lawsuits or class-wide arbitration against Aarogenix. 
                All disputes must be brought individually.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">14.4 Consumer Rights</h3>
              <p>
                Nothing in these Terms limits your rights under Consumer Protection Act, 2019, including the right to approach 
                Consumer Disputes Redressal Commissions for grievances.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">15. Force Majeure</h2>
              <p>
                Neither party shall be liable for failure to perform obligations due to circumstances beyond reasonable control 
                including natural disasters, epidemics, war, terrorism, government actions, labor strikes, power outages, 
                internet disruptions, or cyberattacks on third-party infrastructure. Affected party must provide prompt notice 
                and make reasonable efforts to resume performance.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">16. Modifications to Terms</h2>
              <p className="mb-4">
                We reserve the right to modify these Terms at any time. Material changes will be communicated via email and 
                prominent platform notification at least 30 days before taking effect. Changes will be posted with updated 
                "Last Updated" date.
              </p>
              <p>
                Continued use of Services after changes take effect constitutes acceptance of modified Terms. If you do not 
                agree, you must discontinue use and may cancel your subscription for pro-rata refund.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">17. Miscellaneous Provisions</h2>
              
              <h3 className="text-xl font-semibold text-gray-900 mb-3 mt-4">17.1 Entire Agreement</h3>
              <p className="mb-4">
                These Terms, together with Privacy Policy, Service Level Agreement, and applicable Order Forms/Invoices, 
                constitute the entire agreement between parties and supersede all prior agreements.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">17.2 Severability</h3>
              <p className="mb-4">
                If any provision is found invalid or unenforceable by a court of competent jurisdiction, the remaining 
                provisions shall continue in full force and effect.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">17.3 No Waiver</h3>
              <p className="mb-4">
                Failure to enforce any provision does not constitute a waiver of that provision or our right to enforce it 
                in the future.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">17.4 Assignment</h3>
              <p className="mb-4">
                You may not assign or transfer these Terms without our prior written consent. We may assign these Terms in 
                connection with merger, acquisition, reorganization, or sale of assets with 30 days' notice.
              </p>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">17.5 Notices</h3>
              <p className="mb-3">All notices must be sent to:</p>
              <div className="bg-gray-50 p-4 rounded-lg mb-4">
                <p><strong>Avyaktha Intelligence Private Limited</strong></p>
                <p>Avyaktha Intelligence, 123 Sports Lane, Bengaluru, India</p>
                <p>Email: contactus@avyakthaintelligence.com</p>
                {/* <p>Phone: +91-[Phone Number]</p> */}
              </div>

              <h3 className="text-xl font-semibold text-gray-900 mb-3">17.6 Language</h3>
              <p>
                These Terms are executed in English. In case of translation into other languages, the English version shall 
                prevail in case of any conflict or ambiguity.
              </p>
            </section>

            <section>
              <h2 className="text-2xl font-bold text-gray-900 mb-4">18. Contact Information</h2>
              <div className="bg-teal-50 p-6 rounded-lg">
                <p className="font-semibold text-lg mb-3">Avyaktha Intelligence Private Limited</p>
                <p className="mb-2"><strong>Registered Office:</strong> Avyaktha Intelligence, 123 Sports Lane, Bengaluru, India</p>
                {/* <p className="mb-2"><strong>CIN:</strong> [Company Identification Number]</p> */}
                {/* <p className="mb-2"><strong>GSTIN:</strong> [GST Number]</p> */}
                <p className="mb-2"><strong>General Inquiries:</strong> contactus@avyakthaintelligence.com</p>
                {/* <p className="mb-2"><strong>Legal/Compliance:</strong> contactus@avyakthaintelligence.com</p>
                <p className="mb-2"><strong>Technical Support:</strong> contactus@avyakthaintelligence.com</p>
                <p className="mb-2"><strong>Data Protection Officer:</strong> contactus@avyakthaintelligence.com</p> */}
                {/* <p><strong>Phone:</strong> +91-[Your Number] | International: +1-[US Number]</p> */}
              </div>
            </section>

            <div className="mt-12 pt-8 border-t-2 border-teal-500">
              <p className="text-sm text-gray-600 font-semibold mb-4">
                ACKNOWLEDGMENT AND ACCEPTANCE
              </p>
              <p className="text-sm text-gray-700">
                By clicking "I Accept," registering for an account, or accessing/using the Services, you acknowledge that 
                you have read, understood, and agree to be bound by these Terms and Conditions, Privacy Policy, and all 
                applicable laws including DPDP Act 2023, IT Act 2000, and relevant healthcare regulations. If you are 
                accepting on behalf of an organization, you represent and warrant that you have authority to bind that 
                organization to these Terms.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default TermsConditions