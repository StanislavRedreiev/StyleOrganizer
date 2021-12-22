
Pod::Spec.new do |s|
  s.name             = "StyleOrganizer"
  s.version          = "1.0.5"
  s.summary          = "StyleOrganizer is style manager for your application working in xibs, storyboards and from code."
  s.description      = "StyleOrganizer is style manager for your application working in xibs, storyboards and from code. You can simply set style filed in component user info to set style. To define style simply create category for RMStyleManager. The style string from compenent will use style from Style Manager."
  
  s.homepage         = "https://github.com/StanislavRedreiev/StyleOrganizer.git"
  s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Super team" => "super.team@gmail.com" }
  s.source           = { :git => "git@github.com:StanislavRedreiev/StyleOrganizer.git", :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'StyleOrganizer/Classes/**/*'
  s.resource_bundles = {
    'StyleOrganizer' => ['StyleOrganizer/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'UIColor+InputMethods'
  s.dependency 'UIImage+ImageWithColor'
end
