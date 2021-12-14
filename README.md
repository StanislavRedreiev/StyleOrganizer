# StyleOrganizer
StyleOrganizer is style manager for your application working in xibs, storyboards and from code. You can simply set style filed in component's user info to set style. To define style simply create extension (swift) or category (objective-c) for StyleOrganizer class. The style string from component will use style from Style Manager.

### Installation

#### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `git@github.com:StanislavRedreiev/StyleOrganizer.git`
- Select "Up to Next Major" with "1.0.3"

#### CocoaPods

```ruby
target 'MyApp' do
  pod 'StyleOrganizer', :git => 'git@github.com:StanislavRedreiev/StyleOrganizer.git'
end
```

### Example

How to define style for some component.
```ruby
extension StyleOrganizer {

    // Description styles here
    @objc class func birthdayTitleLabelStyle() -> SOLabelStyle {
        let style = SOLabelStyle()
        style.font = .headlineBold(size: 29)
        style.textColor = UIColor.codGray
        style.textAlignment = .center
        return style
    }
    
    @objc class func continueButtonStyle() -> SOGradientButtonStyle {
        let style = SOGradientButtonStyle()
        style.font = .bodySemibold(size: 16)
        style.textColor = .white
        style.halfSizeCornereRadius = true
        style.colors = UIColor.brandBlueGradient
        style.angle = 90.0
        style.maskToBounds = true
        style.title = "SIGN_UP:CONTINUE".localized
        return style
    }
}
```
How to use style in code.
```ruby
@IBOutlet weak var continueButton: SOStylishGradientButton!

override func viewDidLoad() {
    super.viewDidLoad()

    button.applyStyle(StyleOrganizer.continueButtonStyle())
}
```
