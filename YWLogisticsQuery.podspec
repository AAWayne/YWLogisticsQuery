Pod::Spec.new do |s|

  s.name         = "YWLogisticsQuery"
  s.version      = "1.0.0"
  s.summary      = "物流查询/快递查询"
  s.description  = <<-DESC
                  物流查询/快递查询，传入订单号与对应物流公司即可
                 DESC
  s.homepage     = "https://github.com/90candy/YWLogisticsQuery"
  s.license              = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "90Candy" => "90candy.com@gmail.com" }
  s.social_media_url   = "https://www.jianshu.com/u/0f7d26d766f4"
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/90candy/YWLogisticsQuery.git", :tag => s.version }
  s.source_files  = "YWLogisticsQuery/**/*.{h,m}"
  s.requires_arc  = true
  s.dependency "Masonry", "~> 1.1.0"
  s.dependency "SDWebImage", "~> 4.3.0"
  s.resources     = "YWLogisticsQuery/Resources/*.png"

  
 # pod trunk push YWLogisticsQuery.podspec  --allow-warnings

end
