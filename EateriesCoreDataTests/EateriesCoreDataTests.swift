//
//  EateriesCoreDataTests.swift
//  EateriesCoreDataTests
//
//  Created by Kieran Murphy on 13/5/21.
//

import XCTest
import SwiftUI
@testable import EateriesCoreData

class EateriesCoreDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testImageDownload() {
        //Declares the image URL to be downloaded
        guard let imageURL = URL(string: "https://image.shutterstock.com/image-vector/check-icon-260nw-491675362.jpg") else {
            return XCTFail("Invalid URL")
        }
        //Converts the URL into data
        guard let imageData = try? Data(contentsOf: imageURL) else {
            return XCTFail("Cannot convert URL to Data")
        }
        //Converts the data into an image
        guard let uiImage = UIImage(data: imageData) else {
            return XCTFail("Cannot convert Data into an image")
        }
        //Creates an image in SwiftUI
        let testImage = Image(uiImage: uiImage)
        //Checks if the image contains data, passes if so
        XCTAssertNotNil(testImage)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
