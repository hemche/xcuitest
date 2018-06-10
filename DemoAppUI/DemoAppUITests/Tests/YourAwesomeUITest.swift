import XCTest

class YourAwesomeUITest: BaseTest {
    
    //Dummy Tests case which will fail on first execution.
    //Change your locators acccordingly
    func test_Home_Page()
    {
        let appUserName = getValue(dict: usersData, key: "userName")
        let appPassword = getValue(dict: usersData, key: "password")
        print(appUserName)
        print(appPassword)
        homePage.automationAppButton.click()
    }
}
