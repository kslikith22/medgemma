// src/components/Contact.jsx
import { useState } from 'react'

function Contact() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    organization: '',
    phone: '',
    message: ''
  })

  const handleSubmit = (e) => {
    e.preventDefault()
    console.log('Form submitted:', formData)
    alert('Thank you! We will contact you soon.')
    setFormData({ name: '', email: '', organization: '', phone: '', message: '' })
  }

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    })
  }

  return (
    <section id="contact" className="py-20 bg-gradient-to-r from-[#0F2027] via-[#203A43] to-[#2C5364] text-white">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold mb-4">Request a Demo</h2>
          <p className="text-xl text-gray-200">
            See how Aarogenix can transform your healthcare facility
          </p>
        </div>

        <form onSubmit={handleSubmit} className="bg-white/10 backdrop-blur-sm rounded-2xl p-8 space-y-6">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <input
              type="text"
              name="name"
              placeholder="Full Name *"
              required
              value={formData.name}
              onChange={handleChange}
              className="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-teal-400"
            />
            <input
              type="email"
              name="email"
              placeholder="Email Address *"
              required
              value={formData.email}
              onChange={handleChange}
              className="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-teal-400"
            />
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            <input
              type="text"
              name="organization"
              placeholder="Hospital/Organization *"
              required
              value={formData.organization}
              onChange={handleChange}
              className="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-teal-400"
            />
            <input
              type="tel"
              name="phone"
              placeholder="Phone Number *"
              required
              value={formData.phone}
              onChange={handleChange}
              className="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-teal-400"
            />
          </div>

          <textarea
            name="message"
            placeholder="Tell us about your requirements"
            rows="5"
            value={formData.message}
            onChange={handleChange}
            className="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-gray-300 text-white focus:outline-none focus:ring-2 focus:ring-teal-400"
          ></textarea>

          <button
            type="submit"
            className="w-full bg-teal-500 hover:bg-teal-600 text-white font-bold py-4 rounded-lg transition transform hover:scale-105"
          >
            Request Demo
          </button>
        </form>
      </div>
    </section>
  )
}

export default Contact
