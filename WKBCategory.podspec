Pod::Spec.new do |s|
  s.name         = "WKBCategory"
  s.version      = "0.0.3"
  s.summary      = "WKBCategory"
  s.description  = "封装自己项目常用到的类别"
  s.homepage     = "https://github.com/a-stupid-wood/WKBCategory"
  s.license      = "MIT"
  s.author       = { "Kerwin" => "13763072736@163.com" }
  s.source       = { :git => "https://github.com/a-stupid-wood/WKBCategory.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.platform     = :ios, "9.0"
  s.source_files = "WKBCategory/WKBCategory.h", "WKBCategory/UIView+wkb/*.{h,m}", "WKBCategory/NSString+wkb/*.{h,m}", "WKBCategory/UIButton+wkb/*.{h,m}", "WKBCategory/UIColor+wkb/*.{h,m}", "WKBCategory/UIImage+wkb/*.{h,m}", "WKBCategory/NSDate+wkb/*.{h,m}"
  s.frameworks = 'Foundation', 'UIKit'
end
