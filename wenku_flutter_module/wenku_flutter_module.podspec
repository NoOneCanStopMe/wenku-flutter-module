Pod::Spec.new do |s|
  s.name             = 'wenku_flutter_module'
  s.version          = '0.0.1'
  s.summary          = 'wenku_flutter_module.'
  s.description      = <<-DESC
				wenku_flutter_module.
                       DESC

  s.homepage         = 'https://github.com/NoOneCanStopMe/wenku-flutter-module'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'h' => 'email' }
  s.source           = { :git => 'https://github.com/NoOneCanStopMe/wenku-flutter-module.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'ios/Flutter/**/*'
  s.vendored_frameworks = 'ios/Flutter/**/*.framework'
end
