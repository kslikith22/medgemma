// src/components/Navbar.jsx
import { useState } from 'react'

function Navbar() {
  const [isOpen, setIsOpen] = useState(false)

  return (
    <nav className="bg-gradient-to-r from-[#0F2027] via-[#203A43] to-[#2C5364] text-white sticky top-0 z-50 shadow-lg">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <div className="flex-shrink-0">
            <h2 className="text-2xl font-bold">Aarogenix</h2>
          </div>
          
          {/* Desktop Menu */}
          <div className="hidden md:flex items-center space-x-8">
            <a href="#features" className="hover:text-teal-300 transition">Features</a>
            <a href="#ai-analysis" className="hover:text-teal-300 transition">AI Analysis</a>
            <a href="#benefits" className="hover:text-teal-300 transition">Benefits</a>
            <a href="#demo" className="hover:text-teal-300 transition">Demo</a>
            <a href="#contact" className="bg-teal-500 hover:bg-teal-600 px-6 py-2 rounded-lg font-semibold transition">
              Request Demo
            </a>
          </div>

          {/* Mobile Menu Button */}
          <div className="md:hidden">
            <button onClick={() => setIsOpen(!isOpen)} className="focus:outline-none">
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                {isOpen ? (
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                ) : (
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
                )}
              </svg>
            </button>
          </div>
        </div>

        {/* Mobile Menu */}
        {isOpen && (
          <div className="md:hidden pb-4 space-y-3">
            <a href="#features" className="block hover:text-teal-300 transition">Features</a>
            <a href="#ai-analysis" className="block hover:text-teal-300 transition">AI Analysis</a>
            <a href="#benefits" className="block hover:text-teal-300 transition">Benefits</a>
            <a href="#demo" className="block hover:text-teal-300 transition">Demo</a>
            <a href="#contact" className="block bg-teal-500 hover:bg-teal-600 px-6 py-2 rounded-lg font-semibold text-center transition">
              Request Demo
            </a>
          </div>
        )}
      </div>
    </nav>
  )
}

export default Navbar
