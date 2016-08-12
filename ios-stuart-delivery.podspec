Pod::Spec.new do |s|
  s.name         = "ios-stuart-delivery"
  s.version      = "0.0.3"
  s.summary      = "iOS SDK for Stuart delivery."
  s.description  = <<-DESC
                  An iOS library that helps using Stuart delivery API.
                   DESC
  s.homepage     = "http://annastrzezek.pl"
  s.license      = "MIT"
  s.author       = { "Anna Strzezek" => "hello@annastrzezek.pl" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/aniastrzezek/ios-stuart-delivery-sdk.git", :tag => "#{s.version}" }
  s.source_files  = "StuartDeliverySDK", "StuartDeliverySDK/**/*.{h,m}"
end
