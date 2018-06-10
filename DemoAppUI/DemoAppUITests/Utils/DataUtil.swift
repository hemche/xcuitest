import Foundation
import XCTest

class DataUtil {
    
    /// Method to return the Key/Value pairs from a given Json file
    ///
    /// - Parameter fileName: Json File Name
    /// - Returns: returns the dictionary object
    func loadJson(_ fileName: String) -> [String: AnyObject]? {
        if let url = Bundle.main.url(forResource: "/PlugIns/DemoAppUITests.xctest/"+fileName, withExtension: "json") {
            if let data = NSData(contentsOf: url) {
                
                do {
                    let object = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments)
                    if let dictionary = object as? [String: AnyObject] {
                        return dictionary
                    }
                } catch {
                    print("Unable to parse  \(fileName).json. Do Check if the data has proper JSON structure")
                    exit(0)
                }
            }
            print("Unable to load  \(fileName).json. Do Check if the data has proper JSON structure")
            exit(0)
        }
        return nil
    }
    
    /// Gets the value of a Key inside a JSon
    ///
    /// - Parameters:
    ///   - dict: dictionary object of the Json file
    ///   - key: the name of the key
    /// - Returns: returns the value of the key requested for
    func getValue(dict: [String: AnyObject], key: String) -> String{
        var stringValue = "defaultString"
        if let value = dict[key]{
            stringValue = value as! String
        }
        else {
            XCTFail("There is no Key by Name :"+key+" in the test data Json")
        }
        return stringValue
    }
    
    
    /// Gets the value(String Array) of a Key inside a Json
    ///
    /// - Parameters:
    ///   - dict: dictionary object of the Json file
    ///   - key: the name of the key
    /// - Returns: returns the String Array present in the value of the Key provided
    func getStringArr(dict: [String: AnyObject], key: String) -> [String]{
        var stringValue = ["defaultStringArray"]
        if let value = dict[key]{
            stringValue = value as! [String]
        }
        else {
            XCTFail("There is no Key by Name :"+key+" in the test data Json")
        }
        return stringValue
    }
    
    
    /// Get the value at the index
    ///
    /// - Parameters:
    ///   - dict: Key Value Dictionary
    ///   - key: The name of the Key(string Array Name)
    ///   - index: The index of the value which is reauired
    /// - Returns: The value present at the index
    func getValueAt(dict: [String: AnyObject], key: String, index: Int) -> String {
        let strArray : [String] = getStringArr(dict: dict, key: key)
        var stringValue = "defaultValueInJsonArray"
        
        if strArray.indices.contains(index){
            stringValue = strArray[index]
        }
        else {
            XCTFail("There is no Value in the test jSon inside the json Array "+strArray.description+" for the key :"+key+" at index "+String(index))
        }
        return stringValue
    }
    
}
