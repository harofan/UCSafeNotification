Pod::Spec.new do |s|
  s.name         = "UCSafeNotification"
  s.version      = "1.0"
  s.summary      = "一个安全方便的利用代理思想和NSHashTable实现的通知"
  s.homepage     = "https://github.com/RPGLiker/UCSafeNotification"
  s.license      = "MIT"
  s.author       = { "RPGLiker" => "fanyang_32012@outlook.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/RPGLiker/UCSafeNotification.git", :tag => "#{s.version}" }
  s.source_files  = "UCSafeNotification/UCSafeNotification/**/*.{h,m}"
  s.requires_arc = true
  # s.exclude_files = "Classes/Exclude"

end