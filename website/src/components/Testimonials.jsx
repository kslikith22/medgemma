// src/components/Testimonials.jsx
function Testimonials() {
  const testimonials = [
    {
      name: 'Dr. Sarah Johnson',
      role: 'Chief Medical Officer',
      hospital: 'Metro General Hospital',
      quote: 'The AI-powered ECG analysis has transformed our cardiology department. We can now provide faster, more accurate diagnoses.'
    },
    {
      name: 'Rajesh Kumar',
      role: 'Hospital Administrator',
      hospital: 'City Care Medical Center',
      quote: 'Implementation was smooth, and the OMS integration has reduced patient wait times by 35%. Highly recommended!'
    },
    {
      name: 'Dr. Emily Chen',
      role: 'Cardiologist',
      hospital: 'Heart Care Institute',
      quote: 'The ECG AI analysis is incredibly accurate and has become an indispensable tool in my daily practice.'
    }
  ]

  return (
    <section className="py-20 bg-gradient-to-br from-teal-50 to-blue-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 className="text-4xl font-bold text-center text-gray-900 mb-16">
          Trusted by Healthcare Professionals
        </h2>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {testimonials.map((testimonial, index) => (
            <div key={index} className="bg-white rounded-xl p-8 shadow-lg hover:shadow-xl transition">
              <div className="text-teal-500 text-4xl mb-4">"</div>
              <p className="text-gray-700 mb-6 italic">{testimonial.quote}</p>
              <div className="border-t pt-4">
                <p className="font-bold text-gray-900">{testimonial.name}</p>
                <p className="text-sm text-gray-600">{testimonial.role}</p>
                <p className="text-sm text-teal-600">{testimonial.hospital}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default Testimonials
