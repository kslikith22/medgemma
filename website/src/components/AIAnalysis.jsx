// src/components/AIAnalysis.jsx
function AIAnalysis() {
  return (
    <section id="ai-analysis" className="py-20 bg-gradient-to-r from-[#0F2027] via-[#203A43] to-[#2C5364] text-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <div>
            <h2 className="text-4xl font-bold mb-6">Advanced ECG AI Analysis</h2>
            <p className="text-xl text-gray-200 mb-8">
              Revolutionary artificial intelligence technology that analyzes ECG data 
              in real-time, providing instant diagnostic insights to healthcare professionals
            </p>

            <div className="space-y-6">
              <div className="flex items-start space-x-4">
                <div className="bg-teal-500 rounded-full p-2 mt-1">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                </div>
                <div>
                  <h4 className="text-xl font-semibold mb-2">Instant Analysis</h4>
                  <p className="text-gray-200">Real-time ECG interpretation with AI-powered detection</p>
                </div>
              </div>

              <div className="flex items-start space-x-4">
                <div className="bg-teal-500 rounded-full p-2 mt-1">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                </div>
                <div>
                  <h4 className="text-xl font-semibold mb-2">Pattern Recognition</h4>
                  <p className="text-gray-200">Identify arrhythmias, anomalies, and critical conditions</p>
                </div>
              </div>

              <div className="flex items-start space-x-4">
                <div className="bg-teal-500 rounded-full p-2 mt-1">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                </div>
                <div>
                  <h4 className="text-xl font-semibold mb-2">Automated Reports</h4>
                  <p className="text-gray-200">Generate comprehensive diagnostic reports automatically</p>
                </div>
              </div>

              <div className="flex items-start space-x-4">
                <div className="bg-teal-500 rounded-full p-2 mt-1">
                  <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
                  </svg>
                </div>
                <div>
                  <h4 className="text-xl font-semibold mb-2">Historical Tracking</h4>
                  <p className="text-gray-200">Compare current results with patient history for trends</p>
                </div>
              </div>
            </div>
          </div>

          <div className="bg-white/10 backdrop-blur-sm rounded-2xl p-8 lg:p-12">
            <div className="aspect-video bg-gradient-to-br from-teal-400/20 to-blue-500/20 rounded-xl flex items-center justify-center border-2 border-teal-400/50">
              <div className="text-center">
                <svg className="w-24 h-24 mx-auto mb-4 text-teal-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                </svg>
                <p className="text-lg">AI-Powered ECG Analysis Interface</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}

export default AIAnalysis
