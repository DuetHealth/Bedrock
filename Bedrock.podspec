#
#  Be sure to run `pod spec lint Bedrock.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name             = 'Bedrock'
  s.version          = '1.0.0'
  s.summary          = 'What's deeper than the foundation?'
  s.description      = "Bedrock is a utility library which provides common extensions of Foundation. The functionality included spans multiple paradigms and is intended to ease users into the nuanced expressivity of Swift."
  s.license          = { type: 'MIT', file: 'LICENSE' }
  s.author           = { 'Duet Health': 'info@duethealth.com' }
  s.social_media_url = 'https://twitter.com/DuetHealth'
  s.source           = { git: 'https://TODO/Bedrock.git', tag: "#{s.version}" }
  s.homepage         = "#{s.source[:git]}"
  s.source_files     = "Bedrock/Sources/**/*.{h,m,swift}"
  s.requires_arc     = true
end
