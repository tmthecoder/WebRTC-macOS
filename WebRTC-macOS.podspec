Pod::Spec.new do |s|
  s.name            = "WebRTC-macOS"
  s.version         = "4577"
  s.license         =  { :type => 'MIT', :file => "LICENSE" }
  s.homepage        = "https://tmthecoder.dev"
  s.authors         = { "Tejas Mehta" => "tmthecoder@gmail.com" }
  s.source          = { :git => "https://github.com/tmthecoder/WebRTC-macOS.git", :tag => s.version.to_s }
  s.summary         = "A pod containing WebRTC built for mac."
  s.vendored_frameworks = "WebRTC.framework"
  s.osx.deployment_target = "10.10"
  s.requires_arc = true
end
