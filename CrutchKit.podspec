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
  s.header_mappings_dir  = "Classes"

  s.subspec 'Proxying' do |pr|
    pr.public_header_files = 'Classes/Proxying/*.h'
    pr.source_files = "Classes/Proxying/**/*.{h,m}"
    pr.dependency 'CrutchKit/Runtime'
  end

  s.subspec 'Runtime' do |rn|
    rn.public_header_files = "Classes/Runtime/*.h"
    rn.source_files = "Classes/Runtime/**/*.{h,m}"
  end

  s.subspec 'Helpers' do |hlp|
    hlp.public_header_files = "Classes/Helpers/*.h"
    hlp.source_files = "Classes/Helpers/**/*.{h,m}"
  end

  s.subspec 'AnimationHandling' do |an|
    an.source_files = "Classes/AnimationHandling/**/*.{h,m}"
    an.dependency 'CrutchKit/Helpers'
  end

  s.subspec 'Debug' do |dbg|
    dbg.source_files = "Classes/Debug/**/*.{h,m}"
  end

end
