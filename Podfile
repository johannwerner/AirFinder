platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!
source 'https://github.com/CocoaPods/Specs.git'
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

# Workspace and project definition
workspace 'AirFinder'
project 'AirFinder.xcodeproj'

def shared_pods
    pod 'PureLayout', '3.1.4'
    pod 'Bolts-Swift', '1.4.0'
    pod 'Alamofire', '4.8.1'
    pod 'SwiftLint', '0.31.0'
    pod 'RxSwift', '4.4.2'
    pod 'R.swift', '5.0.3'
    pod 'Gloss', '2.1.0'
    pod 'SDWebImage', '4.4.6'
end


target 'AirFinder' do
    project 'AirFinder.xcodeproj'
    
    shared_pods
    
end

## Post actions

post_install do |installer|
    
    installer.pods_project.targets.each do |target|
        
        target.build_configurations.each do |config|
            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
            
            if [
                'R.swift.Library'
                ].include?(target.name)
                
                puts "Setting Swift version for #{target.name} to 4.0"
                
                config.build_settings['SWIFT_VERSION'] = '4.0'
            end

        end
        
    end
    
end
