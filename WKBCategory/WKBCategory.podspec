Pod::Spec.new do |spec|
  spec.name         = "WKBCategory"
  spec.version      = "0.0.1"
  spec.summary      = "WKBCategory"
  spec.description  = @"封装自己项目常用到的类别"
  spec.homepage     = "https://github.com/a-stupid-wood/WKBCategory"
  spec.license      = "MIT"
  spec.author             = { "Kerwin" => "13763072736@163.com" }
  spec.source       = { :git => "https://github.com/a-stupid-wood/WKBCategory.git", :tag => "#{spec.version}" }
  spec.requires_arc     = true
  spec.platform     = :ios, "9.0"
  spec.source_files  = "WKBCategory/WKBCategory/Category", "WKBCategory/WKBCategory/Category/*.{h,m}"
  spec.frameworks = 'Foundation', 'UIKit'
end
