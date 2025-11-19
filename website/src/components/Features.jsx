// src/components/Features.jsx
function Features() {
  const features = [
    {
      icon: '👥',
      title: 'Patient Management',
      description: 'Comprehensive patient registration, medical records, and history tracking'
    },
    {
      icon: '📅',
      title: 'Appointment System',
      description: 'Intelligent scheduling for doctors and patients with real-time availability'
    },
    {
      icon: '🏥',
      title: 'OMS Integration',
      description: 'Complete outpatient management with queue management and consultation flow'
    },
    {
      icon: '💊',
      title: 'Pharmacy & Billing',
      description: 'Inventory management, prescription handling, and automated billing'
    },
    {
      icon: '📊',
      title: 'Analytics Dashboard',
      description: 'Real-time insights into hospital operations and patient outcomes'
    },
    {
      icon: '🔒',
      title: 'Secure & Compliant',
      description: 'HIPAA compliant with end-to-end encryption and data security'
    }
  ]

  return (
    <section id="features" className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">
            Complete Hospital Management Suite
          </h2>
          <p className="text-xl text-gray-600 max-w-2xl mx-auto">
            Everything you need to run a modern healthcare facility
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          {features.map((feature, index) => (
            <div key={index} 
                 className="bg-gradient-to-br from-teal-50 to-blue-50 rounded-xl p-8 hover:shadow-xl transition transform hover:-translate-y-1">
              <div className="text-5xl mb-4">{feature.icon}</div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">{feature.title}</h3>
              <p className="text-gray-600">{feature.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  )
}

export default Features
