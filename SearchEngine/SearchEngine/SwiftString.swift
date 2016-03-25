//
//  SwiftString.swift
//  SearchEngine
//
//  Created by Quoc Le on 3/25/16.
//  Copyright © 2016 shizzle.co. All rights reserved.
//

import UIKit

public extension String {
        
        // remove space at lead and trail
        func stringByTrimmingLeadingAndTrailingWhitespace() -> String {
            let leadingAndTrailingWhitespacePattern = "(?:^\\s+)|(?:\\s+$)"
            let regex = try! NSRegularExpression(pattern: leadingAndTrailingWhitespacePattern, options: [.CaseInsensitive])
            let range = NSMakeRange(0, utf16.count)
            let trimmedString = regex.stringByReplacingMatchesInString(self, options: .ReportProgress, range: range, withTemplate: "$1")
            
            return trimmedString
        }
        
        // split string by space
        func splitStringBySpace() -> Array<String> {
            return self.characters.split{$0 == " "}.map(String.init)
        }
        
        func makePatternFromString() -> String {
            return self.lowercaseString.stringByTrimmingLeadingAndTrailingWhitespace().splitStringBySpace().joinWithSeparator(".*")
        }
        
        // remove accents
        mutating func removeAccents() {
            self = self.lowercaseString.stringByFoldingWithOptions(NSStringCompareOptions.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
        }
        
        func isLike(string: String) -> Bool {
            let pattern = string.makePatternFromString()
            if self.rangeOfString(pattern, options: .RegularExpressionSearch) != nil {
                return true
            }
            
            var tmp = self
            tmp.removeAccents()
            if tmp.rangeOfString(pattern, options: .RegularExpressionSearch) != nil {
                return true
            }
            
            // char đ exception
            if self.rangeOfString("đ") != nil {
                // replace đ to d
                if self.stringByReplacingOccurrencesOfString("đ", withString: "d").rangeOfString(pattern, options: .RegularExpressionSearch) != nil {
                    return true
                }
            }
            
            // more exception ...
            
            return false
        }
    }
