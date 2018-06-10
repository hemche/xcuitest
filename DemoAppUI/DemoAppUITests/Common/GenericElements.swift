//
//  GenericElements.swift
//  Drive
//
//  Created by Hemanth  Chevuru on 2018-06-04.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import XCTest


final class GenericElements {
    
    lazy var closeButton = BaseDriveTest().getApp().buttons[AccessibilityIdentifiers.GenericIdentifierMap.closeButton]
    lazy var saveButton = BaseDriveTest().getApp().buttons[AccessibilityIdentifiers.GenericIdentifierMap.saveButton]
    lazy var addButton = BaseDriveTest().getApp().buttons[AccessibilityIdentifiers.GenericIdentifierMap.addButton]

    
}
