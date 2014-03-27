Pod::Spec.new do |s|
  s.name             = "SCReactiveSocial"
  s.version          = "0.1.0"
  s.summary          = "A short description of SCReactiveSocial."
  s.description      = <<-DESC
                       An optional longer description of SCReactiveSocial

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/stefanocomba/SCReactiveSocial"
  #s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Stefano Comba" => "stefano.comba@gmail.com" }
  s.source           = { :git => "git@github.com:stefanocomba/SCReactiveSocial.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/NAME'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.frameworks = 'Accounts', 'Social'
  s.dependency 'ReactiveCocoa'
  s.dependency 'Facebook-iOS-SDK'
end