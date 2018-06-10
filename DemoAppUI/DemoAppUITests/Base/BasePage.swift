import XCTest
import Foundation

class BasePage {
    
    let xctc = XCTestCase()
    lazy var datautil = DataUtil()
    lazy var homePage = HomePage()
    
    lazy var envProps : [String: AnyObject] = datautil.loadJson("environment")!
    lazy var usersData : [String: AnyObject] = datautil.loadJson("users")!
    lazy var introData : [String: AnyObject] = datautil.loadJson("introData")!
    
    /// Taps outside of the element
    ///
    /// - Parameter element: XCUIElment outside of which we need to click
    func tapOutsideOf(element: XCUIElement) {
        let coordinates = element.coordinate(withNormalizedOffset: CGVector(dx:0, dy:0))
        coordinates.withOffset(CGVector(dx:100, dy:100))
        coordinates.tap()
    }
    
    
    /// Clicks a point on the application based on the coordinates
    ///
    /// - Parameters:
    ///   - xCoordinate: The X Coordinate of a point where we need to click on the screen
    ///   - yCoordinate: The Y Coordinate of a point where we need to click on the screen
    func clickCoordinate(xCoordinate: Double, yCoordinate: Double) {
        let normalized = getApp().coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
    
    /// Button
    ///
    /// - Parameter name: Button Name
    /// - Returns: XCUIElement of type button
    func button(_ name: String) -> XCUIElement{
        return getApp().buttons[name]
    }
    
    
    /// Navigation Bar
    ///
    /// - Parameter name: Navigation Bar Identifier
    /// - Returns: XCUIElement of type Navigation Bar
    func navBar(_ name: String) -> XCUIElement{
        return getApp().navigationBars[name]
    }
    
    
    /// SecureField
    ///
    /// - Parameter name: SecureField Identifier
    /// - Returns: XCUIElement of type SecureField
    func secureField(_ name: String) -> XCUIElement{
        return getApp().secureTextFields[name]
    }
    
    
    /// TextField
    ///
    /// - Parameter name: TextField Identifier
    /// - Returns: XCUIElement of type TextField
    func textField(_ name: String) -> XCUIElement{
        return getApp().textFields[name]
    }
    
    
    /// Image
    ///
    /// - Parameter name: Image identifier
    /// - Returns: XCUIelement of type Image
    func image(_ name: String) -> XCUIElement{
        return getApp().images[name]
    }
    
    /// Label Text
    ///
    /// - Parameter name: Text identifier
    /// - Returns: XCUIelement of type StaticText
    func text(_ name: String) -> XCUIElement{
        return getApp().staticTexts[name]
    }
    
    func other(_ name: String) -> XCUIElement{
        return getApp().otherElements[name]
    }
    
    func alert(_ name: String) -> XCUIElement{
        return getApp().alerts[name]
    }
    
    
    /// Getter for the currently running application instance
    ///
    /// - Returns: the instance of currently running application
    func getApp() -> XCUIApplication{
        return BaseTest().getApp()
    }
    
    
    /// Getter for any app other than the main app under test
    ///
    /// - Parameter bundleName: The bundle identifier of the seccondary app
    /// - Returns: returns the XCUIApplication instance of the secondary app
    func getOtherApp(bundleName: String) -> XCUIApplication{
        return XCUIApplication(bundleIdentifier: bundleName)
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
    
}
