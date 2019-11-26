Pod::Spec.new do |s|
  s.name         = "WKBCategory"
  s.version      = "0.0.9"
  s.summary      = "WKBCategory"
  s.description  = "封装自己项目常用到的类别"
  s.homepage     = "https://github.com/a-stupid-wood/WKBCategory"
  s.license      = "MIT"
  s.author       = { "Kerwin" => "13763072736@163.com" }
  s.source       = { :git => "https://github.com/a-stupid-wood/WKBCategory.git", :tag => "#{s.version}" }
  s.requires_arc = true
  s.platform     = :ios, "9.0"
  s.source_files = "WKBCategory/WKBCategory.h"
  s.frameworks = 'Foundation', 'UIKit'

  s.subspec 'UIView+wkb' do |ss|
    ss.source_files = "WKBCategory/UIView+wkb/*.{h,m}"
  end
  
  s.subspec 'NSString+wkb' do |ss|
    ss.source_files = "WKBCategory/NSString+wkb/*.{h,m}"
  end

  s.subspec 'UIButton+wkb' do |ss|
    ss.source_files = "WKBCategory/UIButton+wkb/*.{h,m}"
  end

  s.subspec 'UIColor+wkb' do |ss|
    ss.source_files = "WKBCategory/UIColor+wkb/*.{h,m}"
  end

  s.subspec 'UIImage+wkb' do |ss|
    ss.source_files = "WKBCategory/UIImage+wkb/*.{h,m}"
  end

  s.subspec 'NSDate+wkb' do |ss|
    ss.source_files = "WKBCategory/NSDate+wkb/*.{h,m}"
  end

end
