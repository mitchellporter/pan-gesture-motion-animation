source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!
link_with ‘PanTesting’
platform :ios, '8.0'
inhibit_all_warnings!
target 'PanTesting' do
pod ‘MotionAnimation’
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end

post_install do |installer|
    `find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end
