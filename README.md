# xcuitest
//Command to execute your test based on a scheme
xcodebuild -workspace DemoApp.xcworkspace -scheme AllTests -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 7,OS=11.4" clean test 
