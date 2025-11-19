// src/components/Benefits.jsx
function Benefits() {
  return (
    <section id="benefits" className="py-20 bg-gray-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 className="text-4xl font-bold text-center text-gray-900 mb-16">
          Why Choose Aarogenix
        </h2>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          <div className="bg-white rounded-xl p-8 shadow-lg text-center hover:shadow-xl transition">
            <div className="text-teal-600 text-5xl font-bold mb-4">40%</div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Improve Efficiency</h3>
            <p className="text-gray-600">Streamline operations and reduce administrative overhead</p>
          </div>

          <div className="bg-white rounded-xl p-8 shadow-lg text-center hover:shadow-xl transition">
            <div className="text-teal-600 text-5xl font-bold mb-4">95%</div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Patient Satisfaction</h3>
            <p className="text-gray-600">Better outcomes through AI-assisted diagnostics and care coordination</p>
          </div>

          <div className="bg-white rounded-xl p-8 shadow-lg text-center hover:shadow-xl transition">
            <div className="text-teal-600 text-5xl font-bold mb-4">30%</div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Cost Savings</h3>
            <p className="text-gray-600">Optimize resource allocation and minimize operational expenses</p>
          </div>

          <div className="bg-white rounded-xl p-8 shadow-lg text-center hover:shadow-xl transition">
            <div className="text-teal-600 text-5xl font-bold mb-4">100%</div>
            <h3 className="text-xl font-bold text-gray-900 mb-3">Compliance</h3>
            <p className="text-gray-600">Meet all healthcare regulations with built-in compliance features</p>
          </div>
        </div>
      </div>
    </section>
  )
}

export default Benefits
