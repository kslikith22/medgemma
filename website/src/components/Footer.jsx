// src/components/Footer.jsx
function Footer() {
  return (
    <footer className="bg-gray-900 text-gray-300 py-12">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
          <div>
            <h3 className="text-white text-2xl font-bold mb-4">Aarogenix</h3>
            <p className="text-gray-400">
              Transforming healthcare with intelligent management solutions
            </p>
          </div>
          <div>
            <h4 className="text-white font-semibold mb-4">Product</h4>
            <ul className="space-y-2">
              <li>
                <a href="#features" className="hover:text-teal-400 transition">
                  Features
                </a>
              </li>
              <li>
                <a
                  href="#ai-analysis"
                  className="hover:text-teal-400 transition"
                >
                  AI Analysis
                </a>
              </li>
              <li>
                <a href="#demo" className="hover:text-teal-400 transition">
                  Demo
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-teal-400 transition">
                  Pricing
                </a>
              </li>
            </ul>
          </div>
          <div>
            <h4 className="text-white font-semibold mb-4">Company</h4>
            <ul className="space-y-2">
              <li>
                <a href="#" className="hover:text-teal-400 transition">
                  About Us
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-teal-400 transition">
                  Careers
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-teal-400 transition">
                  Blog
                </a>
              </li>
              <li>
                <a href="#contact" className="hover:text-teal-400 transition">
                  Contact
                </a>
              </li>
            </ul>
          </div>
          <div>
            <h4 className="text-white font-semibold mb-4">Legal</h4>
            <ul className="space-y-2">
              <li>
                <a
                  href="/privacy-policy"
                  className="hover:text-teal-400 transition"
                >
                  Privacy Policy
                </a>
              </li>
              <li>
                <a
                  href="/terms-conditions"
                  className="hover:text-teal-400 transition"
                >
                  Terms of Service
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-teal-400 transition">
                  HIPAA Compliance
                </a>
              </li>
              <li>
                <a href="#" className="hover:text-teal-400 transition">
                  Security
                </a>
              </li>
            </ul>
          </div>
        </div>

        <div className="border-t border-gray-800 pt-8 text-center">
          <p className="text-gray-400">
            © 2025 Aarogenix. All rights reserved.
          </p>
        </div>
      </div>
    </footer>
  );
}

export default Footer;
