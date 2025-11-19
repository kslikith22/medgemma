// src/components/Demo.jsx
function Demo() {
  return (
    <section id="demo" className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 className="text-4xl font-bold text-center text-gray-900 mb-16">
          See It In Action
        </h2>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
          <div className="bg-gradient-to-br from-[#0F2027] via-[#203A43] to-[#2C5364] rounded-2xl p-12 flex items-center justify-center text-white">
            <div className="text-center">
              <svg className="w-32 h-32 mx-auto mb-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" />
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              <p className="text-2xl font-semibold mb-2">Product Demo Video</p>
              <p className="text-gray-200">Watch how our platform transforms hospital operations</p>
            </div>
          </div>

          <div className="space-y-6">
            <h3 className="text-2xl font-bold text-gray-900 mb-6">Platform Highlights</h3>
            <ul className="space-y-4">
              {[
                'Intuitive dashboard for doctors and administrators',
                'Patient portal for appointments and medical records',
                'Real-time ECG upload and AI analysis workflow',
                'OMS queue management and consultation tracking',
                'Mobile-responsive design for on-the-go access',
                'Integration with existing hospital systems'
              ].map((item, index) => (
                <li key={index} className="flex items-start space-x-3">
                  <svg className="w-6 h-6 text-teal-500 flex-shrink-0 mt-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <span className="text-gray-700">{item}</span>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </div>
    </section>
  )
}

export default Demo
