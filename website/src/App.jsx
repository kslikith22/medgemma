// src/App.jsx
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import Navbar from './components/Navbar'
import Hero from './components/Hero'
import Features from './components/Features'
import AIAnalysis from './components/AIAnalysis'
import Benefits from './components/Benefits'
import Demo from './components/Demo'
import Testimonials from './components/Testimonials'
import Contact from './components/Contact'
import Footer from './components/Footer'
import PrivacyPolicy from './components/PrivacyPolicy'
import TermsConditions from './components/TermsConditions'

function HomePage() {
  return (
    <>
      <Hero />
      <Features />
      <AIAnalysis />
      <Benefits />
      <Demo />
      <Testimonials />
      <Contact />
    </>
  )
}

function App() {
  return (
    <Router>
      <div className="min-h-screen bg-gray-50">
        <Navbar />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/privacy-policy" element={<PrivacyPolicy />} />
          <Route path="/terms-conditions" element={<TermsConditions />} />
        </Routes>
        <Footer />
      </div>
    </Router>
  )
}

export default App
