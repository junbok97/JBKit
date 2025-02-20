//
//  MoyaProvider+.swift
//  JBKit
//
//  Created by 이준복 on 2/20/25.
//

import Foundation
import Moya

extension MoyaProvider {
    
    func request<T: Decodable>(_ target: Target) async -> Result<T, any Error> {
        do {
            return try await excuteRequest(target)
        } catch {
            guard let moyaError = error as? MoyaError else {
                return .failure(MoyaError.parameterEncoding(error))
            }
            return .failure(moyaError)
        }
    }
    
    func request(_ target: Target) async -> Result<Void, Error> {
        do {
            return try await excuteRequest(target)
        } catch {
            guard let moyaError = error as? MoyaError else {
                return .failure(MoyaError.parameterEncoding(error))
            }
            return .failure(moyaError)
        }
    }
    
    func request<T: Decodable>(_ target: Target) async throws -> T {
        try await excuteRequest(target)
    }
    
    func request(_ target: Target) async throws {
        return try await excuteRequest(target)
    }
    
}


private extension MoyaProvider {
    
    func excuteRequest<T: Decodable> (_ request: Target) async throws -> Result<T, Error> {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self else { return }
            self.request(request) { result in
                switch result {
                case let .success(response):
                    if let error = self.interceptResponseIfNeeded(response) {
                        continuation.resume(returning: .failure(error))
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    guard let object = try? decoder.decode(T.self, from: response.data) else {
                        continuation.resume(throwing: MoyaError.jsonMapping(response))
                        return
                    }
                    continuation.resume(returning: .success(object))
                case let .failure(error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    func excuteRequest(_ request: Target) async throws -> Result<Void, Error> {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self else { return }
            self.request(request) { result in
                switch result {
                case let .success(response):
                    if let error = self.interceptResponseIfNeeded(response) {
                        continuation.resume(returning: .failure(error))
                        return
                    }
                    continuation.resume(returning: .success(()))
                case let .failure(error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    func excuteRequest<T: Decodable> (_ request: Target) async throws -> T {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self else { return }
            self.request(request) { result in
                switch result {
                case let .success(response):
                    if let error = self.interceptResponseIfNeeded(response) {
                        continuation.resume(throwing: error)
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    guard let object = try? decoder.decode(T.self, from: response.data) else {
                        continuation.resume(throwing: MoyaError.jsonMapping(response))
                        return
                    }
                    continuation.resume(returning: object)
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func excuteRequest(_ request: Target) async throws {
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            guard let self else { return }
            self.request(request) { result in
                switch result {
                case let .success(response):
                    if let error = self.interceptResponseIfNeeded(response) {
                        continuation.resume(throwing: error)
                        return
                    }
                    continuation.resume()
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func interceptResponseIfNeeded(_ response: Response) -> Error? {
        guard !((200...299) ~= response.statusCode) else {
            return nil
        }
        return MoyaError.statusCode(response)
    }
    
}

