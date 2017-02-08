Pod::Spec.new do |s|

  s.name         = "CrutchKit"
  s.version      = "0.0.11"
  s.summary      = "CrutchKit is a set of crutches for IOS development."
  s.homepage     = "https://github.com/CognitiveDisson/CrutchKit"
  s.license      = "MIT"
  s.author       = { "Vadim Smal" => "cognitivedisson@gmail.com" }
  s.requires_arc = true
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CognitiveDisson/CrutchKit.git", :tag => s.version.to_s }

  s.subspec 'Proxying' do |pr|
    pr.source_files = 'Classes/Proxying/CDProxying.h', 'Classes/Proxying/**/*'
    pr.dependency 'CrutchKit/Runtime'
  end

  s.subspec 'Runtime' do |rn|
    rn.source_files = 'Classes/Runtime/CDRuntime.h', 'Classes/Runtime/**/*'
  end

  s.subspec 'Helpers' do |hlp|
    hlp.source_files = 'Classes/Helpers/CDHelpers.h', 'Classes/Helpers/**/*'
  end

  s.subspec 'AnimationHandling' do |an|
    an.source_files = 'Classes/AnimationHandling/**/*'
    an.dependency 'CrutchKit/Helpers'
  end

  s.subspec 'Debug' do |dbg|
    dbg.source_files = 'Classes/Debug/**/*'
  end

end
