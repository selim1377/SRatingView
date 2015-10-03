Pod::Spec.new do |s|
  s.name         =  'SRatingView'
  s.version      =  '1.0'
  s.license      =  {:type => 'zlib'}
  s.summary      =  'Simplifies rating visualisation'
  s.homepage     =  'http://github.com/selim1377/SRatingView.git'
  s.author       =  { 'Selim Bakdemir' => 'selim.bakdemir@gmail.com' }
  s.source       =  { :git => 'https://github.com/selim1377/SRatingView.git', :tag => '1.0' }
  s.platform     =  :ios
  s.source_files =  'RatingViewExample/SRatingView.{h,m}'
  s.requires_arc =  true
  s.framework    = 'UIKit'
  s.platform     = :ios, '6.0'
end