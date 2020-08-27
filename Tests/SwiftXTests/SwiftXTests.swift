import XCTest
@testable import SwiftX

final class SwiftXTests: XCTestCase {
     let dateMock: Date = .mock(value: "2020-06-23")
       
       func testDateDiffForHumans() {
           
           guard let year = Calendar.current.date(byAdding: .day, value: -366, to: dateMock) else {
               XCTFail("Interval can't be added")
               return
           }
           
           XCTAssertEqual(year.diffForHumans, "Last year", year.format())
           
           guard let month = Calendar.current.date(byAdding: .day, value: -31, to: dateMock) else {
               XCTFail("Interval can't be added")
               return
           }
           
           XCTAssertEqual(month.diffForHumans, "Last month", month.format())
           
           guard let week = Calendar.current.date(byAdding: .day, value: -7, to: dateMock) else {
               XCTFail("Interval can't be added")
               return
           }
           
           XCTAssertEqual(week.diffForHumans, "Last week", week.format())
           
           guard let Yesterday = Calendar.current.date(byAdding: .day, value: -1, to: dateMock) else {
               XCTFail("Interval can't be added")
               return
           }
           
           XCTAssertEqual(Yesterday.diffForHumans, "Yesterday", Yesterday.format())
           
       }
       
       func testADateCanBeParseFromComponents() {
           
           let date = Date.from(year: 2020, month: 6, day: 23)
           let order = Calendar.current.compare(date, to: dateMock, toGranularity: .day)
           XCTAssertEqual(order, ComparisonResult.orderedSame)
       }
       
       func testADateCanBeFormatToString() {
           
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd"
           
           XCTAssertNotNil(formatter.date(from: dateMock.format()))
       }
       
       func testADateCanNotBeFormattedToStringUsingDifferentFormat() {
           
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-dd"
           
           XCTAssertNil(formatter.date(from: dateMock.format(format: "dd-MM-yyyy")))
       }
       
       func testCanBeParsedFromString() {
           let date = Date.parse("2020-06-23")
           let order = Calendar.current.compare(date, to: dateMock, toGranularity: .day)
           XCTAssertEqual(order, ComparisonResult.orderedSame)
       }
       
       static var allTests = [
           ("testDateDiffForHumans", testDateDiffForHumans),
           ("testADateCanBeParseFromComponents", testADateCanBeParseFromComponents),
           ("testADateCanBeFormatToString", testADateCanBeFormatToString),
           ("testADateCanNotBeFormattedToStringUsingDifferentFormat", testADateCanNotBeFormattedToStringUsingDifferentFormat),
           ("testCanBeParsedFromString", testCanBeParsedFromString),
       ]
}

extension Date {
    static func mock(value: String, format: String = "yyyy-MM-dd") -> Date {
        return Date.parse(value, format: format)
    }
}
