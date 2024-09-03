//
//  Future+.swift
//
//
//  Created by 이준복 on 9/3/24.
//

import Combine

public extension Future where Failure == Never {
    public convenience init(asyncFunc: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do {
                    let result = try await asyncFunc()
                    promise(.success(result))
                } catch {
//                    dump(error)
                }
            }
        }
    }
}
