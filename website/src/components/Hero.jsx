// src/components/Hero.jsx
function Hero() {
  return (
    <section className="bg-gradient-to-br from-[#0F2027] via-[#203A43] to-[#2C5364] text-white py-20 lg:py-32">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center max-w-4xl mx-auto">
          <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold mb-6 leading-tight">
            Transform Healthcare Management with AI-Powered Intelligence
          </h1>
          <p className="text-xl md:text-2xl mb-10 text-gray-200">
            Complete hospital management system with advanced ECG AI analysis, 
            OMS integration, and intelligent patient care solutions
          </p>
          
          <div className="flex flex-col sm:flex-row justify-center gap-4 mb-16">
            <a href="#contact" 
               className="bg-teal-500 hover:bg-teal-600 text-white px-8 py-4 rounded-lg text-lg font-semibold transition transform hover:scale-105">
              Request Demo
            </a>
            <a href="#features" 
               className="bg-white text-[#203A43] hover:bg-gray-100 px-8 py-4 rounded-lg text-lg font-semibold transition transform hover:scale-105">
              Learn More
            </a>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mt-12">
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6">
              <h3 className="text-3xl font-bold mb-2">99.9%</h3>
              <p className="text-gray-200">Uptime Guarantee</p>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6">
              <h3 className="text-3xl font-bold mb-2">AI-Powered</h3>
              <p className="text-gray-200">ECG Analysis</p>
            </div>
            <div className="bg-white/10 backdrop-blur-sm rounded-xl p-6">
              <h3 className="text-3xl font-bold mb-2">Complete</h3>
              <p className="text-gray-200">OMS Integration</p>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}

export default Hero
