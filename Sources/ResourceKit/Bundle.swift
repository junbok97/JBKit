//
//  File.swift
//  JBKit
//
//  Created by 이준복 on 2/28/25.
//

import Foundation


// Dynamic framework일 때 Bundle을 가져오는 방식
private class _Class {}

extension Bundle {
    // _Class 클래스가 위치한 framework의 번들을 가져옴
    static let dynamicResourceBundle = Bundle(for: _Class.self)

    // Static framework일 때 Bundle을 가져오는 방식
    static let staticResourceBundle: Bundle = {
        // 기본 번들, framework안에서 리소스 모듈 이름으로 번들을 가져옴
        let bundleName = "PayShared_PayResource"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: _Class.self).resourceURL,
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundle = candidate
                .flatMap { $0.appendingPathComponent(bundleName + ".bundle") }
                .flatMap { Bundle(url: $0) }
            if let bundle {
                return bundle
            }
        }
        return Bundle(for: _Class.self)
    }()
}
