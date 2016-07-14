Pod::Spec.new do |s|
  s.name         = "AutoMate"
  s.version      = "0.0.1"
  s.summary      = "TODO"
  s.homepage     = "http://TODO"

  s.license      = "TODO"

  s.author    = "PGS Software"

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source       = { :git => "TODO", :tag => "#{s.version}" }

  s.source_files  = "Classes", "AutoMate/**/*.{swift}"

  s.framework  = "XCTest"
end
