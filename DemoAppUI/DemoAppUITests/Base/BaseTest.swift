import XCTest

class BaseTest: XCTestCase {
    
    lazy var  app : XCUIApplication = XCUIApplication()
    lazy var walletApp = XCUIApplication()
    lazy var datautil = DataUtil()
    lazy var envProps : [String: AnyObject] =  datautil.loadJson("environment")!
    lazy var usersData : [String: AnyObject] =  datautil.loadJson("users")!
    lazy var screenshot = ScreenshotUtil()
    lazy var homePage = HomePage()
    
    
    
    
    
    /**Base Set Up Method for all Tests**/
    override func setUpWithError() throws {
        continueAfterFailure = false
        if(app.exists){ app.terminate() }
        app.activate()
    }
    
    
    /**After Test Method**/
    override func tearDownWithError() throws{
        if(getTestRunStatus() > 0){
            screenshot.saveScreenshot(screenShotName:getScreenShotName())
        }
        app.terminate()
    }
    
    /** This method can be used in any of the tests to print the page source**/
    func printPageSource(){
        print(XCUIApplication().debugDescription)
    }
    
    func getScreenShotName() -> String{
        return self.name.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").replacingOccurrences(of: " ", with: "-")
    }
    
    func getTestRunStatus() -> Int{
        return Int(self.testRun!.failureCount)
    }
    
    func getValue(dict: [String: AnyObject], key: String) -> String{
        return DataUtil().getValue(dict: dict, key: key)
    }
    
    func getValueAt(dict: [String: AnyObject], key: String, index: Int) -> String {
        return DataUtil().getValue(dict: dict, key: key)
    }
    
    func getStringArr(dict: [String: AnyObject], key: String) -> [String]{
        return DataUtil().getStringArr(dict:dict, key:key)
    }
    
    func getApp() -> XCUIApplication {
        return self.app
    }
    
}
