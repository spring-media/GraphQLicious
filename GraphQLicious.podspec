#
# Be sure to run `pod lib lint GraphQLicious.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GraphQLicious"
  s.version          = "0.5"
  s.summary          = "A swift component with a DSL to declare GraphQL queries and to get string representations out of them"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        GraphQLicious is a leightweight framework for conveniently creating queries that can be read and interpreted by GraphQL. 
                       DESC

  s.homepage         = "https://github.com/WeltN24/GraphQLicious"
  s.license          = 'MIT'
  s.author           = { "Felix Dietz" => "felix.dietz@weltn24.de" }
  s.source           = { :git => "https://github.com/WeltN24/GraphQLicious.git", :tag => s.version.to_s }

  s.ios.platform = :ios, "9.0"
  s.osx.platform = :osx, "10.10"
  s.watchos.platform = :watchos, "2.0"
  s.tvos.platform = :tvos, "9.0"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0' 
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*.swift', 'Sources/GraphQlicious.h'

  #s.public_header_files = 
end
