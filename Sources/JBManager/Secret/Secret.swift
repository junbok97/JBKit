//
//  Secret.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Foundation

public enum Secret: String {
    
    case apiKey = ""
    
    public var value: String {
        guard let value  = Secret.infoDictionary[rawValue] as? String else {
            fatalError("\(rawValue) 설정이 되지 않았습니다")
        }
        return value
    }
    
}


private extension Secret {
    
    static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("info 파일이 존재하지 않습니다.")
        }
        return dict
    }()
    
}

