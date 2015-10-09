Pod::Spec.new do |s|
  s.name          = "LlamaKit"
  s.version       = "0.0.1"
  s.summary       = "A set a useful bits and bobs for iOS/tvOS development."
  s.description   = "Blah"
  s.homepage      = "http://github.com/adamcooke/LlamaKit"
  s.license       = "MIT"
  s.author        = {"Adam Cooke" => "me@adamcooke.io"}
  s.source        = {:git => "https://github.com/adamcooke/LlamaKit.git", :tag => "0.0.1"}
  s.source_files  = "LlamaKit/Source/**/*.{swift}"
  s.exclude_files = "LlamaKit/Source/Exclude"
end
