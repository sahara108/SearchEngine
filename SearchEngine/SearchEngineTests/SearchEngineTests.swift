//
//  SearchEngineTests.swift
//  SearchEngineTests
//
//  Created by Nguyen Tuan on 3/24/16.
//  Copyright © 2016 shizzle.co. All rights reserved.
//

import XCTest
@testable import SearchEngine

class SearchEngineTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func testIsLike() {
        var contactName = "MèoLuoi"
        var searchText = "meo"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "mèo"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "mèoluoi"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "meoo"
        XCTAssertFalse(contactName.isLike(searchText))
        
        contactName = "Mèo Lười"
        searchText = "m l"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "m a"
        XCTAssertFalse(contactName.isLike(searchText))
        
        contactName = "Uể Oải"
        searchText = "oa"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "ue o"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "uể oài"
        XCTAssertTrue(contactName.isLike(searchText))
        
        contactName = "Định mệnh"
        searchText = "   đ m"
        XCTAssertTrue(contactName.isLike(searchText))
        
        contactName = "明日香"
        searchText = " 日"
        XCTAssertTrue(contactName.isLike(searchText))
        
        contactName = "IZANAMI (イザナミ)"
        searchText = "iz ナミ"
        XCTAssertTrue(contactName.isLike(searchText))
        
        contactName = "e t'aime"
        searchText = "e t'"
        XCTAssertTrue(contactName.isLike(searchText))
   
        
        contactName = "میلیۆن کەس وەکو زمانی"
        searchText = "کەس"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "明"
        XCTAssertFalse(contactName.isLike(searchText))
        
        contactName = "Число глаголатєл҄ь"
        searchText = "тєл҄ь"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "کەس"
        XCTAssertFalse(contactName.isLike(searchText))
        
        contactName = "Je ne sais rien জ্য ন্য সে রিয়াঁ আমি কিছুই জানি না"
        searchText = "کەس"
        XCTAssertFalse(contactName.isLike(searchText))
        
        searchText = "rien জ্য"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "কিছুই"
        XCTAssertTrue(contactName.isLike(searchText))
        
        searchText = "Je রিয়াঁ"
        XCTAssertTrue(contactName.isLike(searchText))
        
    }
    
    
    
}
