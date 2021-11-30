#
# Be sure to run `pod lib lint UIStyleOrganizer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UIStyleOrganizer"
  s.version          = "0.2"
  s.summary          = "UIStyleOrganizer is style manager for your application working in xibs, storyboards and from code."
  s.description      = "UIStyleOrganizer is style manager for your application working in xibs, storyboards and from code. You can simply set style filed in component user info to set style. To define style simply create category for UIStyleOrganizer. The style string from compenent will use style from Style Organizer."

  s.homepage         = "https://github.com/StanislavRedreiev/UIStyleOrganizer"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'Other'
  s.author           = { "team" => "team@style-organizer" }
  s.source           = { :git => "git@github.com:StanislavRedreiev/UIStyleOrganizer.git", :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'UIStyleOrganizer/Classes/**/*'
  s.resource_bundles = {
    'UIStyleOrganizer' => ['UIStyleOrganizer/Assets/*.png']
  }

  s.frameworks = 'UIKit'
  s.dependency 'UIColor+InputMethods'
  s.dependency 'UIImage+ImageWithColor'
end
