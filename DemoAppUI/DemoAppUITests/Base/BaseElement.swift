import XCTest

extension XCUIElement {
    
    /// Wait class which can used by other condition based waits through predicates
    ///
    /// - Parameters:
    ///   - element: XCUIElement on which wait logic is applied
    ///   - predicate: The Condition we are waiting for
    ///   - timeout: time for which we can wait for the condition to be true
    /// - Returns: boolean representation of the result of the wait
    func waitForPredicate(element: XCUIElement,
                          predicate: NSPredicate,
                          timeout: TimeInterval? = nil)  -> XCTWaiter.Result
    {
        let xctc = XCTestCase()
        let myExpectation = xctc.expectation(for: predicate, evaluatedWith: element, handler: nil)
        let result = XCTWaiter().wait(for: [myExpectation], timeout: timeout!, enforceOrder: true)
        return result
    }
    
    /// This method is used to type text into a textfield only after clearing the existing text inside it.
    ///
    /// - Parameter text: "Text to be typed into the text field"
    func sendKeys(_ text: String) -> Void {
        self.click()
        //        if (self.buttons["Clear text"].exists && self.buttons["Clear text"].isHittable)  {
        //            self.buttons["Clear text"].tap()
        //        }
        //        self.click()
        self.typeText(text)
    }
    
    func clear() {
        guard let stringValue = self.value as? String else {
            return
        }
        if let placeholderString = self.placeholderValue, placeholderString == stringValue {
            return
        }
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        self.typeText(deleteString)
    }
    
    /// This Method is used to click an element only after waiting for that element to appear on the page.
    func click() -> Void {
        BaseTest().app.images["Y"].verifyDisappeared(fMsg: "The In Progress indicator did not disappear")
        self.clear()
        if(self.exists && self.isHittable && self.isEnabled){
            self.tap()
        }
        
        else if(self.exists && !(self.isHittable && self.isEnabled)){
            XCTFail("The Element >>"+self.description+"<< exists in the dom but it is not visible on the screen")
        }
        
        else if(!self.exists){
            verifyEnabled(fMsg: "The Element >>"+self.description+"<< is not present on the screen.")
            //            \n Please check the screenshots in this folder "+ScreenshotUtil().getScreenshotFolderPath().standardizedFileURL.absoluteString)
            
        }
    }
    
    
    /// This method is used to handle "Failed to Scroll to visible" errors when a click is performed on an element
    func forceClick(){
        if(self.exists){
            self.click()
        }
        else{
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0,dy:0.0))
            coordinate.tap()
        }
    }
    
    /// This method is used to capture the screenshot of the element
    ///
    /// - Parameter screenShotName: The name of the screenshot
    func screenShot(_ screenShotName: String){
//        let fileName = ScreenshotUtil().getScreenshotFolderPath().appendingPathComponent(screenShotName+self.description+".png")
//        try? UIImage.pngData(self.screenshot().image).()write(to: fileName, options: .atomic)
        let fullScreenshot = XCUIScreen.main.screenshot()
          let screenshot = XCTAttachment(screenshot: fullScreenshot)

          screenshot.lifetime = .keepAlways
//          add(screenshot)
    }
    
    
    /// Waits for an element to appear.
    ///
    /// - Parameter fMsg: "Message to be displayed on failure"
    func verifyPresent(fMsg: String? = "The element did not appear even after "+(BaseTest().envProps["timeout"] as! NSString).doubleValue.description+" seconds") {
        XCTAssertTrue(waitForPredicate(element: self, predicate: NSPredicate(format: "exists == true"), timeout: (BaseTest().envProps["timeout"] as!  NSString).doubleValue) == .completed , fMsg!)
    }
    
    /// Waits for an element to be enabled.
    ///
    /// - Parameter fMsg: Message to be displayed on failure
    func verifyEnabled(fMsg: String? = "The element is not enabled even after "+(BaseTest().envProps["timeout"] as!  NSString).doubleValue.description+" seconds"){
        XCTAssertTrue(waitForPredicate(element: self, predicate: NSPredicate(format: "enabled == true AND hittable == true"), timeout: (BaseTest().envProps["timeout"] as!  NSString).doubleValue) == .completed,fMsg!)
    }
    
    /// Waits for an element to be disabled.
    ///
    /// - Parameter fMsg: Message to be displayed on failure
    func verifyDisabled(fMsg: String? = "The element is not disabled even after "+(BaseTest().envProps["timeout"] as!  NSString).doubleValue.description+" seconds"){
        //        let envProps : [String: AnyObject] = DataUtil().loadEnvProp()!
        XCTAssertTrue(waitForPredicate(element: self, predicate: NSPredicate(format: "enabled == false"), timeout: (BaseTest().envProps["timeout"] as!NSString).doubleValue) == .completed,fMsg!)
    }
    
    /// Waits for an element to disappear.
    ///
    /// - Parameter fMsg: Message to be displayed on failure
    func verifyDisappeared(fMsg: String? = "The element did not get disabled even after "+(BaseTest().envProps["timeout"] as!  NSString).doubleValue.description+" seconds"){
        XCTAssertTrue(waitForPredicate(element: self, predicate: NSPredicate(format: "exists == false"), timeout: (BaseTest().envProps["timeout"] as!  NSString).doubleValue) == .completed, fMsg!)
    }
    
    func verifyText(text: String, Msg: String)
    {
        verifyPresent(fMsg: Msg)
        XCTAssertEqual(self.label, text, "Expected: "+text+" Actual: "+self.label+" "+Msg)
    }
    
    
    func verifyValue(value: String, fMessage: String)
    {
        verifyPresent(fMsg: fMessage)
        XCTAssertEqual(self.value as! String, value, fMessage)
    }
    
}
