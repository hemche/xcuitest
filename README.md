## XCUITest

**Command to run the tests in a scheme(similiar to a suite)**

`cd DemoAppUI`

`
`xcodebuild -scheme "your scheme name without enclosing quotes" -sdk iphonesimulator -destination "platform=iOS Simulator,name="The exact Device name without enclosing quotes",OS="Exact iOS version without enclosing quotes"" clean test`

**Command to run all the tests in a Scheme named "AllTests" on iPhone 14 Pro/iOS 16.2 simulator**

`xcodebuild -scheme AllTests -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 14 Pro,OS=16.2" clean test`


**Command to run all the tests in a Scheme named "AllTests" in Parallel on iPhone 14, iPhone 14 Pro, iPhone 14 Pro Max/iOS 16.2 simulator**

 `xcodebuild -scheme AllTests -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 14,OS=16.2" -destination "platform=iOS Simulator,name=iPhone 14 Pro,OS=16.2" -destination "platform=iOS Simulator,name=iPhone 14 Pro Max,OS=16.2" clean test -parallel-testing-enabled YES`


