//
//  String+.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Foundation

public extension String {

    func toDate() -> Date? {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: self) {
            return date
        }
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = formatter.date(from: self) {
            return date
        }
        
        return nil
    }
    
}
