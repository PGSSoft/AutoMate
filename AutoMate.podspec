Pod::Spec.new do |s|
  s.name         = "AutoMate"
  s.version      = "1.4.3"
  s.summary      = "Swift framework containing set of helpful XCTest extensions for writing UI automation tests."
  s.homepage     = "https://github.com/PGSSoft/AutoMate"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.authors      = {
    "Joanna Bednarz"   => "jbednarz@pgs-soft.com",
    "Paweł Szot"       => "pszot@pgs-soft.com",
    "Bartosz Janda"    => "bjanda@pgs-soft.com",
    "Paweł Kania"      => "pkania@pgs-soft.com",
    "Michał Myśliwiec" => "mmysliwiec@pgs-soft.com",
    "Ewelina Cyło"     => "ecylo@pgs-soft.com",
    "Mateusz Nicpoń"   => "mnicpon@pgs-soft.com"
  }

  s.ios.deployment_target = '10.3'
  s.osx.deployment_target = '10.12'
  s.tvos.deployment_target = '9.2'

  s.source        = { :git => "https://github.com/PGSSoft/AutoMate.git", :tag => "#{s.version}" }

  s.source_files  = "AutoMate/**/*.{swift}"
  s.ios.resources = ["AutoMate/Models/Messages/*.json"]

  s.framework = "XCTest"
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
end
