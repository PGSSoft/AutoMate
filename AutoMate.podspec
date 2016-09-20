Pod::Spec.new do |s|
  s.name         = "AutoMate"
  s.version      = "1.0"
  s.summary      = "Swift framework containing set of helpful XCTest extensions for writing UI automation tests."
  s.homepage     = "https://github.com/PGSSoft/AutoMate"

  s.license      = "MIT"

  s.authors      = {
    "Joanna Bednarz" => "jbednarz@pgs-soft.com",
    "Paweł Szot" => "pszot@pgs-soft.com",
    "Bartosz Janda" => "bjanda@pgs-soft.com",
    "Paweł Kania" => "pkania@pgs-soft.com",
    "Michał Myśliwiec" => "mmysliwiec@pgs-soft.com"
  }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'

  s.source        = { :git => "https://github.com/PGSSoft/AutoMate.git", :tag => "#{s.version}" }

  s.source_files  = "Classes", "AutoMate/**/*.{swift}"

  s.framework = "XCTest"
end
