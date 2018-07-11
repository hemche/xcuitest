## XCUITest

**Command to run the tests in a scheme(similiar to a suite)**

`xcodebuild -workspace "your workspace name without the enclosing quotes" -scheme "your scheme name without enclosing quotes" -sdk iphonesimulator -destination "platform=iOS Simulator,name="The exact Device name without enclosing quotes",OS="Exact iOS version without enclosing quotes"" clean test`

**Command to run all the tests in a Scheme named "SmokeTests" on iPhone 7/iOS 11.4 simulator**

`xcodebuild -workspace DemoApp.xcworkspace -scheme SmokeTests -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 7,OS=11.4" clean test`


**Command to run all the tests in a Scheme named "SmokeTests" in Parallel on iPhone 7, iPhone 6, iPhone 6s/iOS 11.4 simulator**

`xcodebuild -workspace DemoApp.xcworkspace -scheme SmokeTests -sdk iphonesimulator`
            
            -destination "platform=iOS Simulator,name=iPhone 7,OS=11.4" 

            -destination "platform=iOS Simulator,name=iPhone 6,OS=11.4"
            
            -destination "platform=iOS Simulator,name=iPhone 6s,OS=11.4"
            
            clean test`


