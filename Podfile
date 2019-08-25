# Initial configuration
platform :ios, '11.0'
use_frameworks!
inhibit_all_warnings!

target 'NetguruCollegeApp' do
	# Put new pods here
	pod 'SwiftLint', '~> 0.34.0'
	pod 'Kingfisher', '~> 5.0'
		
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end